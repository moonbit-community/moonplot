// Complete original LogitFormatter plus actual NumPy array promotion.

///|
fn logit_params_number_equal(
  actual : ScalarNumber,
  expected : ScalarNumber,
) -> Bool {
  match (actual, expected) {
    (Number(a), Number(b)) | (NumpyFloat64(a), NumpyFloat64(b)) =>
      a.reinterpret_as_uint64() == b.reinterpret_as_uint64()
    _ => actual == expected
  }
}

///|
fn logit_params_number(
  actual : ScalarNumber,
  expected : ScalarNumber,
) -> Unit raise {
  assert_true(logit_params_number_equal(actual, expected))
}

///|
fn logit_params_raw(actual : LogValue, expected : LogValue) -> Unit raise {
  match (actual, expected) {
    (Numeric(a), Numeric(b)) => logit_params_number(a, b)
    _ => assert_eq(actual, expected)
  }
}

///|
fn logit_params_labels(
  formatter : LogitFormatter,
  expected : Array[ScalarNumber],
) -> Unit raise {
  let actual = formatter.labelled()
  assert_eq(actual.length(), expected.length())
  for value in expected {
    assert_true(
      actual.any(key => logit_params_number_equal(key.value(), value)),
    )
  }
}

///|
fn logit_params_case_0() -> Unit raise {
  let formatter = LogitFormatter::new(use_overline=LogValue::NoneValue)
  logit_params_raw(formatter.overline(), LogValue::NoneValue)
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_1() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_2() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_3() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_4() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_5() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_6() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_7() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_8() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_9() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_10() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_11() -> Unit raise {
  let formatter = LogitFormatter::new(use_overline=LogValue::Text(""))
  logit_params_raw(formatter.overline(), LogValue::Text(""))
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_12() -> Unit raise {
  let formatter = LogitFormatter::new(use_overline=LogValue::Text("False"))
  logit_params_raw(formatter.overline(), LogValue::Text("False"))
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_13() -> Unit raise {
  let formatter = LogitFormatter::new(use_overline=LogValue::Text("A-B"))
  logit_params_raw(formatter.overline(), LogValue::Text("A-B"))
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_14() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_15() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_16() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_17() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_18() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_19() -> Unit raise {
  let formatter = LogitFormatter::new(one_half=LogValue::NoneValue)
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::NoneValue)
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_20() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_21() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_22() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_23() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_24() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_25() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_26() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_27() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_28() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_29() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_30() -> Unit raise {
  let formatter = LogitFormatter::new(one_half=LogValue::Text(""))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text(""))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_31() -> Unit raise {
  let formatter = LogitFormatter::new(one_half=LogValue::Text("False"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("False"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_32() -> Unit raise {
  let formatter = LogitFormatter::new(one_half=LogValue::Text("A-B"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("A-B"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_33() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_34() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_35() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_36() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_37() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_38() -> Unit raise {
  let formatter = LogitFormatter::new(minor=LogValue::NoneValue)
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(formatter.minor(), LogValue::NoneValue)
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_39() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_40() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_41() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_42() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_43() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_44() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_45() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_46() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_47() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_48() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_49() -> Unit raise {
  let formatter = LogitFormatter::new(minor=LogValue::Text(""))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(formatter.minor(), LogValue::Text(""))
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_50() -> Unit raise {
  let formatter = LogitFormatter::new(minor=LogValue::Text("False"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(formatter.minor(), LogValue::Text("False"))
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_51() -> Unit raise {
  let formatter = LogitFormatter::new(minor=LogValue::Text("A-B"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(formatter.minor(), LogValue::Text("A-B"))
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_52() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_53() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_54() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_55() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_56() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_57() -> Unit raise {
  let formatter = LogitFormatter::new(minor_threshold=LogValue::NoneValue)
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_58() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_59() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_60() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_61() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_62() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_63() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_64() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_65() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_66() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_67() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_68() -> Unit raise {
  let formatter = LogitFormatter::new(minor_threshold=LogValue::Text(""))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::Text(""))
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_69() -> Unit raise {
  let formatter = LogitFormatter::new(minor_threshold=LogValue::Text("False"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::Text("False"))
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_70() -> Unit raise {
  let formatter = LogitFormatter::new(minor_threshold=LogValue::Text("A-B"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::Text("A-B"))
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_71() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_72() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_73() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_74() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_75() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_76() -> Unit raise {
  let formatter = LogitFormatter::new(minor_number=LogValue::NoneValue)
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_77() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_78() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_79() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_80() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_81() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_82() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_83() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_84() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_85() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_86() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_87() -> Unit raise {
  let formatter = LogitFormatter::new(minor_number=LogValue::Text(""))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(formatter.minor_number(), LogValue::Text(""))
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_88() -> Unit raise {
  let formatter = LogitFormatter::new(minor_number=LogValue::Text("False"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(formatter.minor_number(), LogValue::Text("False"))
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_89() -> Unit raise {
  let formatter = LogitFormatter::new(minor_number=LogValue::Text("A-B"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(formatter.minor_number(), LogValue::Text("A-B"))
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_90() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_91() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_92() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_93() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_94() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  assert_true(locations is FormatterLocations::Sequence(_))
}

///|
fn logit_params_case_95() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::NoneValue)
  logit_params_raw(formatter.overline(), LogValue::NoneValue)
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_96() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::Boolean(false)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_97() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::Boolean(true)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_98() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_99() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_100() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::Number(0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_101() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::Number(-0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_102() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::Number(0.5)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_103() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_104() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_105() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_106() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Text(""))
  logit_params_raw(formatter.overline(), LogValue::Text(""))
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_107() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Text("False"))
  logit_params_raw(formatter.overline(), LogValue::Text("False"))
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_108() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Text("A-B"))
  logit_params_raw(formatter.overline(), LogValue::Text("A-B"))
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_109() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_110() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_111() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_112() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(LogValue::Numeric(ScalarNumber::NumpyBool(false)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_113() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.use_overline(
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_114() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::NoneValue)
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::NoneValue)
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_115() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::Boolean(false)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_116() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::Boolean(true)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_117() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_118() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_119() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::Number(0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_120() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::Number(-0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_121() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::Number(0.5)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_122() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_123() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_124() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_125() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Text(""))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text(""))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_126() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Text("False"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("False"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_127() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Text("A-B"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("A-B"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_128() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_129() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_130() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_131() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(LogValue::Numeric(ScalarNumber::NumpyBool(false)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_132() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_one_half(
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.one_half(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_133() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(LogValue::NoneValue)
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_134() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(LogValue::Numeric(ScalarNumber::Boolean(false)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_135() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(LogValue::Numeric(ScalarNumber::Boolean(true)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_136() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_137() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_138() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(LogValue::Numeric(ScalarNumber::Number(0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_139() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(LogValue::Numeric(ScalarNumber::Number(-0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_140() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(LogValue::Numeric(ScalarNumber::Number(0.5)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_141() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_142() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_143() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_144() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(LogValue::Text(""))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::Text(""))
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_145() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(LogValue::Text("False"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::Text("False"))
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_146() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(LogValue::Text("A-B"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::Text("A-B"))
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_147() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_148() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(
    LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_149() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_150() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_151() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_threshold(
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_152() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::NoneValue)
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_153() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::Boolean(false)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_154() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::Boolean(true)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_155() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_156() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_157() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::Number(0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_158() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::Number(-0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_159() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::Number(0.5)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_160() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_161() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_162() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_163() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Text(""))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(formatter.minor_number(), LogValue::Text(""))
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_164() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Text("False"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(formatter.minor_number(), LogValue::Text("False"))
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_165() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Text("A-B"))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(formatter.minor_number(), LogValue::Text("A-B"))
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_166() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_167() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_168() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_169() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(LogValue::Numeric(ScalarNumber::NumpyBool(false)))
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_170() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let locations = formatter.locations()
  let cache = logit_formatter_state(formatter.as_base_formatter()).labelled
  formatter.set_minor_number(
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  assert_true(
    physical_equal(
      cache,
      logit_formatter_state(formatter.as_base_formatter()).labelled,
    ),
  )
  let prior = match locations {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  let current = match formatter.locations() {
    NdArray(view) => view
    _ => abort("ndarray")
  }
  assert_true(physical_equal(prior, current))
}

///|
fn logit_params_case_171() -> Unit raise {
  let keys : Array[LogitKey] = []
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
}

///|
fn logit_params_case_172() -> Unit raise {
  let keys : Array[LogitKey] = [LogitKey::new(ScalarNumber::Boolean(false))]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(false))
}

///|
fn logit_params_case_173() -> Unit raise {
  let keys : Array[LogitKey] = [LogitKey::new(ScalarNumber::Boolean(true))]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(true))
}

///|
fn logit_params_case_174() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_175() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-1L))
}

///|
fn logit_params_case_176() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
}

///|
fn logit_params_case_177() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(0), 9223372036854775808UL)
}

///|
fn logit_params_case_178() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(0), 18446744073709551615UL)
}

///|
fn logit_params_case_179() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_180() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_181() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_182() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_183() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_184() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_185() -> Unit raise {
  let keys : Array[LogitKey] = [LogitKey::new(ScalarNumber::NumpyInt64(-2L))]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_186() -> Unit raise {
  let keys : Array[LogitKey] = [LogitKey::new(ScalarNumber::NumpyBool(true))]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 1)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(true))
}

///|
fn logit_params_case_187() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(false))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(false))
}

///|
fn logit_params_case_188() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(false))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(true))
}

///|
fn logit_params_case_189() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_190() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-1L))
}

///|
fn logit_params_case_191() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
}

///|
fn logit_params_case_192() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(array.get_uint64(0), 0UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(1), 9223372036854775808UL)
}

///|
fn logit_params_case_193() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(array.get_uint64(0), 0UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(1), 18446744073709551615UL)
}

///|
fn logit_params_case_194() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::Boolean(false))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_195() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::Boolean(false))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_196() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_197() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_198() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_199() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_200() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_201() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(false)),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(false))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(true))
}

///|
fn logit_params_case_202() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(true))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(false))
}

///|
fn logit_params_case_203() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(true))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(true))
}

///|
fn logit_params_case_204() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_205() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-1L))
}

///|
fn logit_params_case_206() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(1L))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
}

///|
fn logit_params_case_207() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(array.get_uint64(0), 1UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(1), 9223372036854775808UL)
}

///|
fn logit_params_case_208() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(array.get_uint64(0), 1UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(1), 18446744073709551615UL)
}

///|
fn logit_params_case_209() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::Boolean(true))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_210() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::Boolean(true))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_211() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_212() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_213() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_214() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_215() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_216() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(true))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(true))
}

///|
fn logit_params_case_217() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_218() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(1L))
}

///|
fn logit_params_case_219() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_220() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-1L))
}

///|
fn logit_params_case_221() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
}

///|
fn logit_params_case_222() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_223() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_224() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_225() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_226() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_227() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_228() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_229() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_230() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_231() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(0L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(1L))
}

///|
fn logit_params_case_232() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_233() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(1L))
}

///|
fn logit_params_case_234() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_235() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-1L))
}

///|
fn logit_params_case_236() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-1L))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
}

///|
fn logit_params_case_237() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_238() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_239() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_240() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_241() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_242() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_243() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_244() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_245() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_246() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(1L))
}

///|
fn logit_params_case_247() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_248() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(1L))
}

///|
fn logit_params_case_249() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_250() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-1L))
}

///|
fn logit_params_case_251() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
}

///|
fn logit_params_case_252() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_253() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_254() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_255() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_256() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_257() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_258() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_259() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_260() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_261() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(1L))
}

///|
fn logit_params_case_262() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(0), 9223372036854775808UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(array.get_uint64(1), 0UL)
}

///|
fn logit_params_case_263() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(0), 9223372036854775808UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(array.get_uint64(1), 1UL)
}

///|
fn logit_params_case_264() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_265() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_266() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_267() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(0), 9223372036854775808UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(1), 9223372036854775808UL)
}

///|
fn logit_params_case_268() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(0), 9223372036854775808UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(1), 18446744073709551615UL)
}

///|
fn logit_params_case_269() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_270() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_271() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_272() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_273() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_274() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_275() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_276() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(0), 9223372036854775808UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(array.get_uint64(1), 1UL)
}

///|
fn logit_params_case_277() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(0), 18446744073709551615UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(array.get_uint64(1), 0UL)
}

///|
fn logit_params_case_278() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(0), 18446744073709551615UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(array.get_uint64(1), 1UL)
}

///|
fn logit_params_case_279() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_280() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_281() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_282() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(0), 18446744073709551615UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(1), 9223372036854775808UL)
}

///|
fn logit_params_case_283() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(0), 18446744073709551615UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(1), 18446744073709551615UL)
}

///|
fn logit_params_case_284() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_285() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_286() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_287() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_288() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_289() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_290() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_291() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(0), 18446744073709551615UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(array.get_uint64(1), 1UL)
}

///|
fn logit_params_case_292() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::Boolean(false))
}

///|
fn logit_params_case_293() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::Boolean(true))
}

///|
fn logit_params_case_294() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
}

///|
fn logit_params_case_295() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
  )
}

///|
fn logit_params_case_296() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
  )
}

///|
fn logit_params_case_297() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
}

///|
fn logit_params_case_298() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
}

///|
fn logit_params_case_299() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_300() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_301() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_302() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_303() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_304() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_305() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_306() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(true))
}

///|
fn logit_params_case_307() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::Boolean(false))
}

///|
fn logit_params_case_308() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::Boolean(true))
}

///|
fn logit_params_case_309() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
}

///|
fn logit_params_case_310() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
  )
}

///|
fn logit_params_case_311() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
  )
}

///|
fn logit_params_case_312() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
}

///|
fn logit_params_case_313() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
}

///|
fn logit_params_case_314() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_315() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_316() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_317() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_318() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_319() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_320() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_321() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(true))
}

///|
fn logit_params_case_322() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_323() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_324() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_325() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_326() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_327() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_328() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_329() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_330() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_331() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_332() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_333() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_334() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_335() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_336() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_337() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_338() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_339() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_340() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_341() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_342() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_343() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_344() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_345() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_346() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_347() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_348() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_349() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_350() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_351() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_352() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_353() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_354() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_355() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_356() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_357() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_358() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_359() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_360() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_361() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_362() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_363() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_364() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_365() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_366() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_367() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_368() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_369() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_370() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13830554455654793216UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_371() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_372() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_373() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_374() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_375() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_376() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_377() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_378() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_379() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_380() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_381() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_382() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_383() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(1L))
}

///|
fn logit_params_case_384() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_385() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-1L))
}

///|
fn logit_params_case_386() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
}

///|
fn logit_params_case_387() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_388() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4895412794951729152UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_389() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_390() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_391() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_392() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_393() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_394() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_395() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_396() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(1L))
}

///|
fn logit_params_case_397() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(ScalarNumber::Boolean(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(true))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(false))
}

///|
fn logit_params_case_398() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(true))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(true))
}

///|
fn logit_params_case_399() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
}

///|
fn logit_params_case_400() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-1L))
}

///|
fn logit_params_case_401() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775807")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(1L))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
}

///|
fn logit_params_case_402() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(array.get_uint64(0), 1UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  assert_eq(array.get_uint64(1), 9223372036854775808UL)
}

///|
fn logit_params_case_403() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "uint64")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(array.get_uint64(0), 1UL)
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551615")),
  )
  assert_eq(array.get_uint64(1), 18446744073709551615UL)
}

///|
fn logit_params_case_404() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(true))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_405() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(true))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775809")),
  )
}

///|
fn logit_params_case_406() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(
      ScalarNumber::Number(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_407() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9223372036854775808UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_408() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_409() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_410() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_411() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(true)),
    LogitKey::new(ScalarNumber::NumpyBool(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "bool")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(true))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(true))
}

///|
fn logit_params_case_412() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_413() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_414() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_415() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::Boolean(true))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_416() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_417() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_418() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_419() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::Boolean(true))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_420() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_421() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_422() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_423() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_424() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_425() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_426() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_427() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_428() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_429() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_430() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_431() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_432() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_433() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_434() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_435() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_436() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_437() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_438() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_439() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_440() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_441() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_442() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_443() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_444() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_445() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_446() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_447() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_448() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::Boolean(true))
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_449() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_450() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_451() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_452() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(locations.get_value(2), ScalarNumber::Boolean(true))
}

///|
fn logit_params_case_453() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
}

///|
fn logit_params_case_454() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
}

///|
fn logit_params_case_455() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_456() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(locations.get_value(2), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_457() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(locations.get_value(2), ScalarNumber::NumpyBool(false))
}

///|
fn logit_params_case_458() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_459() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(false))
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_460() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_461() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_462() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_463() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::Boolean(true))
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_464() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_465() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_466() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_467() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_468() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_469() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_470() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_471() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_472() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_473() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_474() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_475() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_476() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_477() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_478() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(locations.get_value(2), ScalarNumber::Boolean(true))
}

///|
fn logit_params_case_479() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
}

///|
fn logit_params_case_480() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
  )
}

///|
fn logit_params_case_481() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_482() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(locations.get_value(2), ScalarNumber::NumpyInt64(-2L))
}

///|
fn logit_params_case_483() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(locations.get_value(2), ScalarNumber::NumpyBool(false))
}

///|
fn logit_params_case_484() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_485() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_486() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_487() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_488() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_489() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_490() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_491() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_492() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_493() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyBool(false))
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_494() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_495() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_496() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_497() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_498() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_499() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_500() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_501() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_502() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_503() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-2L))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_504() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_505() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_506() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_507() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_508() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(ScalarNumber::Boolean(true)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_509() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_510() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_511() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(false))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_512() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Boolean(true)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_513() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_514() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9223372036854775808")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4890909195324358656UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_515() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(
      ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let array = match locations {
    FormatterLocations::Typed(array) => array
    _ => abort("expected typed ndarray")
  }
  assert_eq(array.dtype(), "object")
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyBool(false))
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::Integer(@bigint.BigInt::from_string("18446744073709551616")),
  )
}

///|
fn logit_params_case_516() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_517() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_518() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(ScalarNumber::NumpyInt64(-2L)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(13835058055282163712UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_519() -> Unit raise {
  let keys : Array[LogitKey] = [
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(ScalarNumber::NumpyBool(false)),
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    ),
  ]
  let formatter = LogitFormatter::new()
  formatter.set_locs_keys(keys)
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_520() -> Unit raise {
  let owner = [
    4596373779694328218UL.reinterpret_as_double(),
    4599075939470750515UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
  ]
  let full = TickValues::from_array(owner)
  let view = full.view(2, -1, 3)
  let formatter = LogitFormatter::new()
  formatter.set_locs_view(view)
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 3)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4600877379321698714UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(2),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
  }
  owner[2] = 0.0
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4600877379321698714UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_521() -> Unit raise {
  let owner = [
    4596373779694328218UL.reinterpret_as_double(),
    4599075939470750515UL.reinterpret_as_double(),
  ]
  let full = TickValues::from_array(owner)
  let view = full.view(0, 0, 3)
  let formatter = LogitFormatter::new()
  formatter.set_locs_view(view)
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 3)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(2),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
  }
  owner[0] = 0.0
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_522() -> Unit raise {
  let owner = [9007199254740993L, 0L, -1L]
  let full = TickValues::from_int64_array(owner)
  let view = full.view(2, -1, 3)
  let formatter = LogitFormatter::new()
  formatter.set_locs_view(view)
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 3)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), true)
    logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-1L))
    logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
    logit_params_number(
      locations.get_value(2),
      ScalarNumber::NumpyInt64(9007199254740993L),
    )
  }
  owner[2] = 0L
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), true)
  logit_params_number(locations.get_value(0), ScalarNumber::NumpyInt64(-1L))
  logit_params_number(locations.get_value(1), ScalarNumber::NumpyInt64(0L))
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyInt64(9007199254740993L),
  )
}

///|
fn logit_params_case_523() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::NoneValue,
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: '<' not supported between instances of 'int' and 'NoneType'",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_524() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Text("6"),
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: '<' not supported between instances of 'int' and 'str'",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::Text("6"))
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_525() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-2")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-2"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_526() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_527() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_528() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_529() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_530() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("3"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_531() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("4")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("4"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_532() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_533() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_534() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(3.5)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(3.5)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_535() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_536() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_537() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_538() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_539() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_540() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_541() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_542() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(
      ScalarNumber::NumpyInt64(-9223372036854775808L),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-9223372036854775808L)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_543() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_544() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_545() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_546() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_547() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::NoneValue,
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: '<' not supported between instances of 'int' and 'NoneType'",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_548() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Text("6"),
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: '<' not supported between instances of 'int' and 'str'",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(formatter.minor_number(), LogValue::Text("6"))
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_549() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-2")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-2"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_550() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_551() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_552() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_553() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_554() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("3"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_555() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("4")),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("4"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_556() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: slice indices must be integers or None or have an __index__ method",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_557() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: slice indices must be integers or None or have an __index__ method",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_558() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::Number(3.5)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(3.5)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_559() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: slice indices must be integers or None or have an __index__ method",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_560() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_561() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: slice indices must be integers or None or have an __index__ method",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_562() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_563() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_564() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: The numpy boolean negative, the `-` operator, is not supported, use the `~` operator or the logical_not function instead.",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_565() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: The numpy boolean negative, the `-` operator, is not supported, use the `~` operator or the logical_not function instead.",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_566() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::NumpyInt64(-9223372036854775808L),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(-9223372036854775808L)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_567() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_568() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  let error = try {
    ignore(formatter.set_locs([0.02, 0.3, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: slice indices must be integers or None or have an __index__ method",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_569() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4581421828931458171UL.reinterpret_as_double()),
    ScalarNumber::Number(4599075939470750515UL.reinterpret_as_double()),
    ScalarNumber::Number(4605380978949069210UL.reinterpret_as_double()),
  ])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_570() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  formatter.set_locs([0.02, 0.3, 0.8])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4581421828931458171UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_571() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(false)),
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
}

///|
fn logit_params_case_572() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(false)),
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([
    4591870180066957722UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
    4606281698874543309UL.reinterpret_as_double(),
  ])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4591870180066957722UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4602678819172646912UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4606281698874543309UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_573() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(false)),
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([
    4596373779694328218UL.reinterpret_as_double(),
    4599075939470750515UL.reinterpret_as_double(),
  ])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_574() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
}

///|
fn logit_params_case_575() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([
    4591870180066957722UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
    4606281698874543309UL.reinterpret_as_double(),
  ])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4591870180066957722UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4602678819172646912UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4606281698874543309UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_576() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  let error = try {
    ignore(
      formatter.set_locs([
        4596373779694328218UL.reinterpret_as_double(),
        4599075939470750515UL.reinterpret_as_double(),
      ]),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: '<' not supported between instances of 'int' and 'NoneType'",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_577() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::NoneValue,
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(formatter.minor(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
}

///|
fn logit_params_case_578() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::NoneValue,
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([
    4591870180066957722UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
    4606281698874543309UL.reinterpret_as_double(),
  ])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(formatter.minor(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4591870180066957722UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4602678819172646912UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4606281698874543309UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_579() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::NoneValue,
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([
    4596373779694328218UL.reinterpret_as_double(),
    4599075939470750515UL.reinterpret_as_double(),
  ])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(formatter.minor(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_580() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Text(""),
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(formatter.minor(), LogValue::Text(""))
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 0)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
}

///|
fn logit_params_case_581() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Text(""),
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([
    4591870180066957722UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
    4606281698874543309UL.reinterpret_as_double(),
  ])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(formatter.minor(), LogValue::Text(""))
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 3)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4591870180066957722UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4602678819172646912UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(2),
    ScalarNumber::NumpyFloat64(4606281698874543309UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_582() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Text(""),
    minor_threshold=LogValue::NoneValue,
    minor_number=LogValue::NoneValue,
  )
  formatter.set_locs([
    4596373779694328218UL.reinterpret_as_double(),
    4599075939470750515UL.reinterpret_as_double(),
  ])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(formatter.minor(), LogValue::Text(""))
  logit_params_raw(formatter.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(formatter.minor_number(), LogValue::NoneValue)
  logit_params_labels(formatter, [])
  let locations = formatter.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_583() -> Unit raise {
  let formatter = LogitFormatter::new(one_half=LogValue::NoneValue)
  assert_eq(formatter.call(0.5), "$\\mathdefault{None}$")
}

///|
fn logit_params_case_584() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{False}$")
}

///|
fn logit_params_case_585() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{True}$")
}

///|
fn logit_params_case_586() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{0}$")
}

///|
fn logit_params_case_587() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{-1}$")
}

///|
fn logit_params_case_588() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{0.0}$")
}

///|
fn logit_params_case_589() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{-0.0}$")
}

///|
fn logit_params_case_590() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{0.5}$")
}

///|
fn logit_params_case_591() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{nan}$")
}

///|
fn logit_params_case_592() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{inf}$")
}

///|
fn logit_params_case_593() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{-inf}$")
}

///|
fn logit_params_case_594() -> Unit raise {
  let formatter = LogitFormatter::new(one_half=LogValue::Text(""))
  assert_eq(formatter.call(0.5), "$\\mathdefault{}$")
}

///|
fn logit_params_case_595() -> Unit raise {
  let formatter = LogitFormatter::new(one_half=LogValue::Text("False"))
  assert_eq(formatter.call(0.5), "$\\mathdefault{False}$")
}

///|
fn logit_params_case_596() -> Unit raise {
  let formatter = LogitFormatter::new(one_half=LogValue::Text("A-B"))
  assert_eq(formatter.call(0.5), "$\\mathdefault{A-B}$")
}

///|
fn logit_params_case_597() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{0.5}$")
}

///|
fn logit_params_case_598() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{-2}$")
}

///|
fn logit_params_case_599() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{True}$")
}

///|
fn logit_params_case_600() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  assert_eq(formatter.call(0.5), "$\\mathdefault{False}$")
}

///|
fn logit_params_case_601() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(
    formatter.call(0.5),
    "$\\mathdefault{10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}$",
  )
}

///|
fn logit_params_case_602() -> Unit raise {
  let formatter = LogitFormatter::new(
    one_half=LogValue::Numeric(ScalarNumber::Integer(decimal_power(4300))),
  )
  let error = try {
    ignore(formatter.call(0.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit",
  )
}

///|
fn logit_params_case_603() -> Unit raise {
  let formatter = LogitFormatter::new(use_overline=LogValue::NoneValue)
  assert_eq(formatter.call(0.9), "$\\mathdefault{1-10^{-1}}$")
}

///|
fn logit_params_case_604() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{1-10^{-1}}$")
}

///|
fn logit_params_case_605() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_606() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{1-10^{-1}}$")
}

///|
fn logit_params_case_607() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_608() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{1-10^{-1}}$")
}

///|
fn logit_params_case_609() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{1-10^{-1}}$")
}

///|
fn logit_params_case_610() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_611() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_612() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_613() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_614() -> Unit raise {
  let formatter = LogitFormatter::new(use_overline=LogValue::Text(""))
  assert_eq(formatter.call(0.9), "$\\mathdefault{1-10^{-1}}$")
}

///|
fn logit_params_case_615() -> Unit raise {
  let formatter = LogitFormatter::new(use_overline=LogValue::Text("False"))
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_616() -> Unit raise {
  let formatter = LogitFormatter::new(use_overline=LogValue::Text("A-B"))
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_617() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::NumpyFloat64(0.5)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_618() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::NumpyInt64(-2L)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_619() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_620() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{1-10^{-1}}$")
}

///|
fn logit_params_case_621() -> Unit raise {
  let formatter = LogitFormatter::new(
    use_overline=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(formatter.call(0.9), "$\\mathdefault{\\overline{10^{-1}}}$")
}

///|
fn logit_params_case_622() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let copied = formatter.copy()
  assert_true(
    physical_equal(
      logit_formatter_state(formatter.as_base_formatter()).labelled,
      logit_formatter_state(copied.as_base_formatter()).labelled,
    ),
  )
  copied.set_locs([0.4, 0.6])
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [
    ScalarNumber::Number(4600877379321698714UL.reinterpret_as_double()),
    ScalarNumber::Number(4603579539098121011UL.reinterpret_as_double()),
  ])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  logit_params_raw(
    copied.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(copied.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    copied.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    copied.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    copied.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(copied, [
    ScalarNumber::Number(4600877379321698714UL.reinterpret_as_double()),
    ScalarNumber::Number(4603579539098121011UL.reinterpret_as_double()),
  ])
  {
    let locations = copied.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4600877379321698714UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4603579539098121011UL.reinterpret_as_double()),
    )
  }
  let exported = formatter.labelled()
  exported.clear()
  assert_eq(formatter.labelled().length(), 2)
}

///|
fn logit_params_case_623() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  formatter.set_locs([0.2, 0.3])
  let copied = formatter.copy()
  copied.set_minor_threshold(LogValue::NoneValue)
  let error = try {
    ignore(copied.set_locs([0.7, 0.8]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: '<' not supported between instances of 'int' and 'NoneType'",
  )
  logit_params_raw(
    formatter.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(formatter.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    formatter.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(
    formatter.minor_threshold(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("25"))),
  )
  logit_params_raw(
    formatter.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(formatter, [])
  {
    let locations = formatter.locations()
    assert_eq(locations.length(), 2)
    let view = match locations {
      FormatterLocations::NdArray(view) => view
      _ => abort("expected ndarray")
    }
    assert_eq(view.is_int64(), false)
    logit_params_number(
      locations.get_value(0),
      ScalarNumber::NumpyFloat64(4596373779694328218UL.reinterpret_as_double()),
    )
    logit_params_number(
      locations.get_value(1),
      ScalarNumber::NumpyFloat64(4599075939470750515UL.reinterpret_as_double()),
    )
  }
  logit_params_raw(
    copied.overline(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  logit_params_raw(copied.one_half(), LogValue::Text("\\frac{1}{2}"))
  logit_params_raw(
    copied.minor(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  logit_params_raw(copied.minor_threshold(), LogValue::NoneValue)
  logit_params_raw(
    copied.minor_number(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("20"))),
  )
  logit_params_labels(copied, [])
  let locations = copied.locations()
  assert_eq(locations.length(), 2)
  let view = match locations {
    FormatterLocations::NdArray(view) => view
    _ => abort("expected ndarray")
  }
  assert_eq(view.is_int64(), false)
  logit_params_number(
    locations.get_value(0),
    ScalarNumber::NumpyFloat64(4604480259023595110UL.reinterpret_as_double()),
  )
  logit_params_number(
    locations.get_value(1),
    ScalarNumber::NumpyFloat64(4605380978949069210UL.reinterpret_as_double()),
  )
}

///|
fn logit_params_case_624() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  let identity = LogitKey::new(
    ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
  )
  formatter.set_locs_keys([LogitKey::new(ScalarNumber::Number(-0.2)), identity])
  let error = try {
    ignore(formatter.call_key(identity))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: cannot convert float NaN to integer")
  assert_eq(
    formatter.call_value(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    "",
  )
}

///|
fn logit_params_case_625() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  let identity = LogitKey::new(
    ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
  )
  formatter.set_locs_keys([LogitKey::new(ScalarNumber::Number(-0.2)), identity])
  let error = try {
    ignore(formatter.call_key(identity))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: cannot convert float NaN to integer")
  assert_eq(
    formatter.call_value(
      ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
    ),
    "",
  )
}

///|
fn logit_params_case_626() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  let error = try {
    ignore(formatter.format_ticks([-0.2, 0.0 / 0.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: cannot convert float NaN to integer")
}

///|
fn logit_params_case_627() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
    minor_number=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("20")),
    ),
  )
  assert_eq(
    formatter.format_ticks_view(TickValues::from_array([-0.2, 0.0 / 0.0])),
    ["", ""],
  )
}

///|
fn logit_params_case_628() -> Unit raise {
  let formatter = LogitFormatter::new()
  let other = LogitFormatter::new()
  let first = match formatter.locations() {
    Sequence(values) => values
    _ => abort("list")
  }
  let second = match other.locations() {
    Sequence(values) => values
    _ => abort("list")
  }
  assert_true(physical_equal(first, second))
  let base = formatter.as_base_formatter()
  let family_view = base.logit_formatter().unwrap()
  assert_true(physical_equal(base, family_view.as_base_formatter()))
  formatter.create_dummy_axis(minpos=0.37)
  let copied = formatter.copy()
  assert_eq(formatter.axis(), copied.axis())
  assert_eq(formatter.axis().unwrap().dummy_minpos(), Some(0.37))
  assert_eq(formatter.get_offset(), "")
  family_view.set_one_half(LogValue::Text("live"))
  assert_eq(formatter.one_half(), LogValue::Text("live"))
  copied.set_one_half(LogValue::Text("independent"))
  assert_eq(formatter.one_half(), LogValue::Text("live"))
}

///|
fn logit_params_case_629() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(
    formatter.format_data_short_value(
      ScalarNumber::Number(4600336947366414254UL.reinterpret_as_double()),
    ),
    "0.370000",
  )
}

///|
fn logit_params_case_630() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(
    formatter.format_data_short_value(
      ScalarNumber::Number(9223372036854775808UL.reinterpret_as_double()),
    ),
    "-0.000000e+00",
  )
}

///|
fn logit_params_case_631() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(
    formatter.format_data_short_value(
      ScalarNumber::NumpyFloat64(4600336947366414254UL.reinterpret_as_double()),
    ),
    "0.370000",
  )
}

///|
fn logit_params_case_632() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyInt64(0L)),
    "0.000000e+00",
  )
}

///|
fn logit_params_case_633() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::Boolean(false)),
    "0.000000e+00",
  )
}

///|
fn logit_params_case_634() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyBool(true)),
    "1-0.000000e+00",
  )
}

///|
fn logit_params_case_635() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(
    formatter.format_data_short_value(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
    "1-nan",
  )
}

///|
fn logit_params_case_636() -> Unit raise {
  let formatter = LogitFormatter::new(
    minor=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(
    formatter.format_data_short_value(
      ScalarNumber::Number(9218868437227405312UL.reinterpret_as_double()),
    ),
    "1--inf",
  )
}

///|
test "logit formatter parameters source group 0" {
  logit_params_case_0()
  logit_params_case_1()
  logit_params_case_2()
  logit_params_case_3()
  logit_params_case_4()
  logit_params_case_5()
  logit_params_case_6()
  logit_params_case_7()
  logit_params_case_8()
  logit_params_case_9()
  logit_params_case_10()
  logit_params_case_11()
  logit_params_case_12()
  logit_params_case_13()
  logit_params_case_14()
  logit_params_case_15()
  logit_params_case_16()
  logit_params_case_17()
  logit_params_case_18()
  logit_params_case_19()
  logit_params_case_20()
  logit_params_case_21()
  logit_params_case_22()
  logit_params_case_23()
  logit_params_case_24()
  logit_params_case_25()
  logit_params_case_26()
  logit_params_case_27()
  logit_params_case_28()
  logit_params_case_29()
  logit_params_case_30()
  logit_params_case_31()
}

///|
test "logit formatter parameters source group 1" {
  logit_params_case_32()
  logit_params_case_33()
  logit_params_case_34()
  logit_params_case_35()
  logit_params_case_36()
  logit_params_case_37()
  logit_params_case_38()
  logit_params_case_39()
  logit_params_case_40()
  logit_params_case_41()
  logit_params_case_42()
  logit_params_case_43()
  logit_params_case_44()
  logit_params_case_45()
  logit_params_case_46()
  logit_params_case_47()
  logit_params_case_48()
  logit_params_case_49()
  logit_params_case_50()
  logit_params_case_51()
  logit_params_case_52()
  logit_params_case_53()
  logit_params_case_54()
  logit_params_case_55()
  logit_params_case_56()
  logit_params_case_57()
  logit_params_case_58()
  logit_params_case_59()
  logit_params_case_60()
  logit_params_case_61()
  logit_params_case_62()
  logit_params_case_63()
}

///|
test "logit formatter parameters source group 2" {
  logit_params_case_64()
  logit_params_case_65()
  logit_params_case_66()
  logit_params_case_67()
  logit_params_case_68()
  logit_params_case_69()
  logit_params_case_70()
  logit_params_case_71()
  logit_params_case_72()
  logit_params_case_73()
  logit_params_case_74()
  logit_params_case_75()
  logit_params_case_76()
  logit_params_case_77()
  logit_params_case_78()
  logit_params_case_79()
  logit_params_case_80()
  logit_params_case_81()
  logit_params_case_82()
  logit_params_case_83()
  logit_params_case_84()
  logit_params_case_85()
  logit_params_case_86()
  logit_params_case_87()
  logit_params_case_88()
  logit_params_case_89()
  logit_params_case_90()
  logit_params_case_91()
  logit_params_case_92()
  logit_params_case_93()
  logit_params_case_94()
  logit_params_case_95()
}

///|
test "logit formatter parameters source group 3" {
  logit_params_case_96()
  logit_params_case_97()
  logit_params_case_98()
  logit_params_case_99()
  logit_params_case_100()
  logit_params_case_101()
  logit_params_case_102()
  logit_params_case_103()
  logit_params_case_104()
  logit_params_case_105()
  logit_params_case_106()
  logit_params_case_107()
  logit_params_case_108()
  logit_params_case_109()
  logit_params_case_110()
  logit_params_case_111()
  logit_params_case_112()
  logit_params_case_113()
  logit_params_case_114()
  logit_params_case_115()
  logit_params_case_116()
  logit_params_case_117()
  logit_params_case_118()
  logit_params_case_119()
  logit_params_case_120()
  logit_params_case_121()
  logit_params_case_122()
  logit_params_case_123()
  logit_params_case_124()
  logit_params_case_125()
  logit_params_case_126()
  logit_params_case_127()
}

///|
test "logit formatter parameters source group 4" {
  logit_params_case_128()
  logit_params_case_129()
  logit_params_case_130()
  logit_params_case_131()
  logit_params_case_132()
  logit_params_case_133()
  logit_params_case_134()
  logit_params_case_135()
  logit_params_case_136()
  logit_params_case_137()
  logit_params_case_138()
  logit_params_case_139()
  logit_params_case_140()
  logit_params_case_141()
  logit_params_case_142()
  logit_params_case_143()
  logit_params_case_144()
  logit_params_case_145()
  logit_params_case_146()
  logit_params_case_147()
  logit_params_case_148()
  logit_params_case_149()
  logit_params_case_150()
  logit_params_case_151()
  logit_params_case_152()
  logit_params_case_153()
  logit_params_case_154()
  logit_params_case_155()
  logit_params_case_156()
  logit_params_case_157()
  logit_params_case_158()
  logit_params_case_159()
}

///|
test "logit formatter parameters source group 5" {
  logit_params_case_160()
  logit_params_case_161()
  logit_params_case_162()
  logit_params_case_163()
  logit_params_case_164()
  logit_params_case_165()
  logit_params_case_166()
  logit_params_case_167()
  logit_params_case_168()
  logit_params_case_169()
  logit_params_case_170()
  logit_params_case_171()
  logit_params_case_172()
  logit_params_case_173()
  logit_params_case_174()
  logit_params_case_175()
  logit_params_case_176()
  logit_params_case_177()
  logit_params_case_178()
  logit_params_case_179()
  logit_params_case_180()
  logit_params_case_181()
  logit_params_case_182()
  logit_params_case_183()
  logit_params_case_184()
  logit_params_case_185()
  logit_params_case_186()
  logit_params_case_187()
  logit_params_case_188()
  logit_params_case_189()
  logit_params_case_190()
  logit_params_case_191()
}

///|
test "logit formatter parameters source group 6" {
  logit_params_case_192()
  logit_params_case_193()
  logit_params_case_194()
  logit_params_case_195()
  logit_params_case_196()
  logit_params_case_197()
  logit_params_case_198()
  logit_params_case_199()
  logit_params_case_200()
  logit_params_case_201()
  logit_params_case_202()
  logit_params_case_203()
  logit_params_case_204()
  logit_params_case_205()
  logit_params_case_206()
  logit_params_case_207()
  logit_params_case_208()
  logit_params_case_209()
  logit_params_case_210()
  logit_params_case_211()
  logit_params_case_212()
  logit_params_case_213()
  logit_params_case_214()
  logit_params_case_215()
  logit_params_case_216()
  logit_params_case_217()
  logit_params_case_218()
  logit_params_case_219()
  logit_params_case_220()
  logit_params_case_221()
  logit_params_case_222()
  logit_params_case_223()
}

///|
test "logit formatter parameters source group 7" {
  logit_params_case_224()
  logit_params_case_225()
  logit_params_case_226()
  logit_params_case_227()
  logit_params_case_228()
  logit_params_case_229()
  logit_params_case_230()
  logit_params_case_231()
  logit_params_case_232()
  logit_params_case_233()
  logit_params_case_234()
  logit_params_case_235()
  logit_params_case_236()
  logit_params_case_237()
  logit_params_case_238()
  logit_params_case_239()
  logit_params_case_240()
  logit_params_case_241()
  logit_params_case_242()
  logit_params_case_243()
  logit_params_case_244()
  logit_params_case_245()
  logit_params_case_246()
  logit_params_case_247()
  logit_params_case_248()
  logit_params_case_249()
  logit_params_case_250()
  logit_params_case_251()
  logit_params_case_252()
  logit_params_case_253()
  logit_params_case_254()
  logit_params_case_255()
}

///|
test "logit formatter parameters source group 8" {
  logit_params_case_256()
  logit_params_case_257()
  logit_params_case_258()
  logit_params_case_259()
  logit_params_case_260()
  logit_params_case_261()
  logit_params_case_262()
  logit_params_case_263()
  logit_params_case_264()
  logit_params_case_265()
  logit_params_case_266()
  logit_params_case_267()
  logit_params_case_268()
  logit_params_case_269()
  logit_params_case_270()
  logit_params_case_271()
  logit_params_case_272()
  logit_params_case_273()
  logit_params_case_274()
  logit_params_case_275()
  logit_params_case_276()
  logit_params_case_277()
  logit_params_case_278()
  logit_params_case_279()
  logit_params_case_280()
  logit_params_case_281()
  logit_params_case_282()
  logit_params_case_283()
  logit_params_case_284()
  logit_params_case_285()
  logit_params_case_286()
  logit_params_case_287()
}

///|
test "logit formatter parameters source group 9" {
  logit_params_case_288()
  logit_params_case_289()
  logit_params_case_290()
  logit_params_case_291()
  logit_params_case_292()
  logit_params_case_293()
  logit_params_case_294()
  logit_params_case_295()
  logit_params_case_296()
  logit_params_case_297()
  logit_params_case_298()
  logit_params_case_299()
  logit_params_case_300()
  logit_params_case_301()
  logit_params_case_302()
  logit_params_case_303()
  logit_params_case_304()
  logit_params_case_305()
  logit_params_case_306()
  logit_params_case_307()
  logit_params_case_308()
  logit_params_case_309()
  logit_params_case_310()
  logit_params_case_311()
  logit_params_case_312()
  logit_params_case_313()
  logit_params_case_314()
  logit_params_case_315()
  logit_params_case_316()
  logit_params_case_317()
  logit_params_case_318()
  logit_params_case_319()
}

///|
test "logit formatter parameters source group 10" {
  logit_params_case_320()
  logit_params_case_321()
  logit_params_case_322()
  logit_params_case_323()
  logit_params_case_324()
  logit_params_case_325()
  logit_params_case_326()
  logit_params_case_327()
  logit_params_case_328()
  logit_params_case_329()
  logit_params_case_330()
  logit_params_case_331()
  logit_params_case_332()
  logit_params_case_333()
  logit_params_case_334()
  logit_params_case_335()
  logit_params_case_336()
  logit_params_case_337()
  logit_params_case_338()
  logit_params_case_339()
  logit_params_case_340()
  logit_params_case_341()
  logit_params_case_342()
  logit_params_case_343()
  logit_params_case_344()
  logit_params_case_345()
  logit_params_case_346()
  logit_params_case_347()
  logit_params_case_348()
  logit_params_case_349()
  logit_params_case_350()
  logit_params_case_351()
}

///|
test "logit formatter parameters source group 11" {
  logit_params_case_352()
  logit_params_case_353()
  logit_params_case_354()
  logit_params_case_355()
  logit_params_case_356()
  logit_params_case_357()
  logit_params_case_358()
  logit_params_case_359()
  logit_params_case_360()
  logit_params_case_361()
  logit_params_case_362()
  logit_params_case_363()
  logit_params_case_364()
  logit_params_case_365()
  logit_params_case_366()
  logit_params_case_367()
  logit_params_case_368()
  logit_params_case_369()
  logit_params_case_370()
  logit_params_case_371()
  logit_params_case_372()
  logit_params_case_373()
  logit_params_case_374()
  logit_params_case_375()
  logit_params_case_376()
  logit_params_case_377()
  logit_params_case_378()
  logit_params_case_379()
  logit_params_case_380()
  logit_params_case_381()
  logit_params_case_382()
  logit_params_case_383()
}

///|
test "logit formatter parameters source group 12" {
  logit_params_case_384()
  logit_params_case_385()
  logit_params_case_386()
  logit_params_case_387()
  logit_params_case_388()
  logit_params_case_389()
  logit_params_case_390()
  logit_params_case_391()
  logit_params_case_392()
  logit_params_case_393()
  logit_params_case_394()
  logit_params_case_395()
  logit_params_case_396()
  logit_params_case_397()
  logit_params_case_398()
  logit_params_case_399()
  logit_params_case_400()
  logit_params_case_401()
  logit_params_case_402()
  logit_params_case_403()
  logit_params_case_404()
  logit_params_case_405()
  logit_params_case_406()
  logit_params_case_407()
  logit_params_case_408()
  logit_params_case_409()
  logit_params_case_410()
  logit_params_case_411()
  logit_params_case_412()
  logit_params_case_413()
  logit_params_case_414()
  logit_params_case_415()
}

///|
test "logit formatter parameters source group 13" {
  logit_params_case_416()
  logit_params_case_417()
  logit_params_case_418()
  logit_params_case_419()
  logit_params_case_420()
  logit_params_case_421()
  logit_params_case_422()
  logit_params_case_423()
  logit_params_case_424()
  logit_params_case_425()
  logit_params_case_426()
  logit_params_case_427()
  logit_params_case_428()
  logit_params_case_429()
  logit_params_case_430()
  logit_params_case_431()
  logit_params_case_432()
  logit_params_case_433()
  logit_params_case_434()
  logit_params_case_435()
  logit_params_case_436()
  logit_params_case_437()
  logit_params_case_438()
  logit_params_case_439()
  logit_params_case_440()
  logit_params_case_441()
  logit_params_case_442()
  logit_params_case_443()
  logit_params_case_444()
  logit_params_case_445()
  logit_params_case_446()
  logit_params_case_447()
}

///|
test "logit formatter parameters source group 14" {
  logit_params_case_448()
  logit_params_case_449()
  logit_params_case_450()
  logit_params_case_451()
  logit_params_case_452()
  logit_params_case_453()
  logit_params_case_454()
  logit_params_case_455()
  logit_params_case_456()
  logit_params_case_457()
  logit_params_case_458()
  logit_params_case_459()
  logit_params_case_460()
  logit_params_case_461()
  logit_params_case_462()
  logit_params_case_463()
  logit_params_case_464()
  logit_params_case_465()
  logit_params_case_466()
  logit_params_case_467()
  logit_params_case_468()
  logit_params_case_469()
  logit_params_case_470()
  logit_params_case_471()
  logit_params_case_472()
  logit_params_case_473()
  logit_params_case_474()
  logit_params_case_475()
  logit_params_case_476()
  logit_params_case_477()
  logit_params_case_478()
  logit_params_case_479()
}

///|
test "logit formatter parameters source group 15" {
  logit_params_case_480()
  logit_params_case_481()
  logit_params_case_482()
  logit_params_case_483()
  logit_params_case_484()
  logit_params_case_485()
  logit_params_case_486()
  logit_params_case_487()
  logit_params_case_488()
  logit_params_case_489()
  logit_params_case_490()
  logit_params_case_491()
  logit_params_case_492()
  logit_params_case_493()
  logit_params_case_494()
  logit_params_case_495()
  logit_params_case_496()
  logit_params_case_497()
  logit_params_case_498()
  logit_params_case_499()
  logit_params_case_500()
  logit_params_case_501()
  logit_params_case_502()
  logit_params_case_503()
  logit_params_case_504()
  logit_params_case_505()
  logit_params_case_506()
  logit_params_case_507()
  logit_params_case_508()
  logit_params_case_509()
  logit_params_case_510()
  logit_params_case_511()
}

///|
test "logit formatter parameters source group 16" {
  logit_params_case_512()
  logit_params_case_513()
  logit_params_case_514()
  logit_params_case_515()
  logit_params_case_516()
  logit_params_case_517()
  logit_params_case_518()
  logit_params_case_519()
  logit_params_case_520()
  logit_params_case_521()
  logit_params_case_522()
  logit_params_case_523()
  logit_params_case_524()
  logit_params_case_525()
  logit_params_case_526()
  logit_params_case_527()
  logit_params_case_528()
  logit_params_case_529()
  logit_params_case_530()
  logit_params_case_531()
  logit_params_case_532()
  logit_params_case_533()
  logit_params_case_534()
  logit_params_case_535()
  logit_params_case_536()
  logit_params_case_537()
  logit_params_case_538()
  logit_params_case_539()
  logit_params_case_540()
  logit_params_case_541()
  logit_params_case_542()
  logit_params_case_543()
}

///|
test "logit formatter parameters source group 17" {
  logit_params_case_544()
  logit_params_case_545()
  logit_params_case_546()
  logit_params_case_547()
  logit_params_case_548()
  logit_params_case_549()
  logit_params_case_550()
  logit_params_case_551()
  logit_params_case_552()
  logit_params_case_553()
  logit_params_case_554()
  logit_params_case_555()
  logit_params_case_556()
  logit_params_case_557()
  logit_params_case_558()
  logit_params_case_559()
  logit_params_case_560()
  logit_params_case_561()
  logit_params_case_562()
  logit_params_case_563()
  logit_params_case_564()
  logit_params_case_565()
  logit_params_case_566()
  logit_params_case_567()
  logit_params_case_568()
  logit_params_case_569()
  logit_params_case_570()
  logit_params_case_571()
  logit_params_case_572()
  logit_params_case_573()
  logit_params_case_574()
  logit_params_case_575()
}

///|
test "logit formatter parameters source group 18" {
  logit_params_case_576()
  logit_params_case_577()
  logit_params_case_578()
  logit_params_case_579()
  logit_params_case_580()
  logit_params_case_581()
  logit_params_case_582()
  logit_params_case_583()
  logit_params_case_584()
  logit_params_case_585()
  logit_params_case_586()
  logit_params_case_587()
  logit_params_case_588()
  logit_params_case_589()
  logit_params_case_590()
  logit_params_case_591()
  logit_params_case_592()
  logit_params_case_593()
  logit_params_case_594()
  logit_params_case_595()
  logit_params_case_596()
  logit_params_case_597()
  logit_params_case_598()
  logit_params_case_599()
  logit_params_case_600()
  logit_params_case_601()
  logit_params_case_602()
  logit_params_case_603()
  logit_params_case_604()
  logit_params_case_605()
  logit_params_case_606()
  logit_params_case_607()
}

///|
test "logit formatter parameters source group 19" {
  logit_params_case_608()
  logit_params_case_609()
  logit_params_case_610()
  logit_params_case_611()
  logit_params_case_612()
  logit_params_case_613()
  logit_params_case_614()
  logit_params_case_615()
  logit_params_case_616()
  logit_params_case_617()
  logit_params_case_618()
  logit_params_case_619()
  logit_params_case_620()
  logit_params_case_621()
  logit_params_case_622()
  logit_params_case_623()
  logit_params_case_624()
  logit_params_case_625()
  logit_params_case_626()
  logit_params_case_627()
  logit_params_case_628()
  logit_params_case_629()
  logit_params_case_630()
  logit_params_case_631()
  logit_params_case_632()
  logit_params_case_633()
  logit_params_case_634()
  logit_params_case_635()
  logit_params_case_636()
}
