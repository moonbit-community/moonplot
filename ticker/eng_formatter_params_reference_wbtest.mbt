// Complete pinned EngFormatter and actual builtin numeric hash/dict.

///|
fn eng_params_number(
  actual : ScalarNumber,
  expected : ScalarNumber,
) -> Unit raise {
  match (actual, expected) {
    (ScalarNumber::Number(a), ScalarNumber::Number(b))
    | (ScalarNumber::NumpyFloat64(a), ScalarNumber::NumpyFloat64(b)) =>
      if b.is_nan() {
        assert_true(a.is_nan())
      } else {
        assert_eq(a.reinterpret_as_uint64(), b.reinterpret_as_uint64())
      }
    _ => assert_eq(actual, expected)
  }
}

///|
fn eng_params_optional(
  actual : ScalarNumber?,
  expected : ScalarNumber?,
) -> Unit raise {
  match (actual, expected) {
    (Some(a), Some(b)) => eng_params_number(a, b)
    (None, None) => ()
    _ => fail("different optional numeric slot")
  }
}

///|
fn eng_params_case_0() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_1() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(true)
  @config.set_text_usetex(true)
  let formatter = EngFormatter::new()
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), true)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), true)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_2() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(true)
  @config.set_text_usetex(true)
  let formatter = EngFormatter::new(use_offset=None)
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), true)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), true)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), true)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_3() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=None)
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_4() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=None)
  assert_eq(formatter.format_data(1.0), "1")
}

///|
fn eng_params_case_5() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=None)
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_6() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=None)
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_7() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(
    formatter.places(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_8() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  assert_eq(formatter.format_data(1.0), "1.00")
}

///|
fn eng_params_case_9() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_10() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_11() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(
    formatter.places(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_12() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  let message = try {
    ignore(formatter.format_data(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: Format specifier missing precision")
}

///|
fn eng_params_case_13() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_14() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_15() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Boolean(false)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), Some(ScalarNumber::Boolean(false)))
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_16() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Boolean(false)))
  assert_eq(formatter.format_data(1.0), "1")
}

///|
fn eng_params_case_17() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Boolean(false)))
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_18() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Boolean(false)))
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_19() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Boolean(true)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), Some(ScalarNumber::Boolean(true)))
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_20() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Boolean(true)))
  assert_eq(formatter.format_data(1.0), "1.0")
}

///|
fn eng_params_case_21() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Boolean(true)))
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_22() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Boolean(true)))
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_23() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Number(2.0)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), Some(ScalarNumber::Number(2.0)))
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_24() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Number(2.0)))
  let message = try {
    ignore(formatter.format_data(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_25() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Number(2.0)))
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_26() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::Number(2.0)))
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_27() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::NumpyFloat64(2.0)),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), Some(ScalarNumber::NumpyFloat64(2.0)))
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_28() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::NumpyFloat64(2.0)),
  )
  let message = try {
    ignore(formatter.format_data(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_29() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::NumpyFloat64(2.0)),
  )
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_30() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::NumpyFloat64(2.0)),
  )
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_31() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyInt64(2L)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), Some(ScalarNumber::NumpyInt64(2L)))
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_32() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyInt64(2L)))
  assert_eq(formatter.format_data(1.0), "1.00")
}

///|
fn eng_params_case_33() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyInt64(2L)))
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_34() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyInt64(2L)))
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_35() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyBool(true)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), Some(ScalarNumber::NumpyBool(true)))
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_36() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyBool(true)))
  assert_eq(formatter.format_data(1.0), "1.0")
}

///|
fn eng_params_case_37() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyBool(true)))
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_38() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyBool(true)))
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_39() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyBool(false)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), Some(ScalarNumber::NumpyBool(false)))
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_40() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyBool(false)))
  assert_eq(formatter.format_data(1.0), "1")
}

///|
fn eng_params_case_41() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyBool(false)))
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_42() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(places=Some(ScalarNumber::NumpyBool(false)))
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_43() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(decimal_power(4300))),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(
    formatter.places(),
    Some(ScalarNumber::Integer(decimal_power(4300))),
  )
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_44() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(decimal_power(4300))),
  )
  let message = try {
    ignore(formatter.format_data(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit",
  )
}

///|
fn eng_params_case_45() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(decimal_power(4300))),
  )
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit",
  )
}

///|
fn eng_params_case_46() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(decimal_power(4300))),
  )
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit",
  )
}

///|
fn eng_params_case_47() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(decimal_power(4300).neg())),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(
    formatter.places(),
    Some(ScalarNumber::Integer(decimal_power(4300).neg())),
  )
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_48() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(decimal_power(4300).neg())),
  )
  let message = try {
    ignore(formatter.format_data(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit",
  )
}

///|
fn eng_params_case_49() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(decimal_power(4300).neg())),
  )
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit",
  )
}

///|
fn eng_params_case_50() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(decimal_power(4300).neg())),
  )
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit",
  )
}

///|
fn eng_params_case_51() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Number(0.0 / 0.0)),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), Some(ScalarNumber::Number(0.0 / 0.0)))
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_52() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Number(0.0 / 0.0)),
  )
  let message = try {
    ignore(formatter.format_data(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_53() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Number(0.0 / 0.0)),
  )
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_54() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Number(0.0 / 0.0)),
  )
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_55() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Number(1.0 / 0.0)),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), Some(ScalarNumber::Number(1.0 / 0.0)))
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_56() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Number(1.0 / 0.0)),
  )
  let message = try {
    ignore(formatter.format_data(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_57() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Number(1.0 / 0.0)),
  )
  let message = try {
    ignore(formatter.format_data(0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_58() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Number(1.0 / 0.0)),
  )
  let message = try {
    ignore(formatter.format_data(1.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_59() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(use_offset=None)
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), true)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_60() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter.as_scalar_formatter().set_use_offset(None)
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(formatter.as_scalar_formatter().offset(), None)
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_61() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    use_offset=Some(ScalarNumber::Boolean(false)),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_62() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter
  .as_scalar_formatter()
  .set_use_offset(Some(ScalarNumber::Boolean(false)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_63() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    use_offset=Some(ScalarNumber::Boolean(true)),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), true)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_64() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter
  .as_scalar_formatter()
  .set_use_offset(Some(ScalarNumber::Boolean(true)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), true)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_65() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    use_offset=Some(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_66() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter
  .as_scalar_formatter()
  .set_use_offset(Some(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_67() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(use_offset=Some(ScalarNumber::Number(2.0)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Number(2.0)),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_68() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter
  .as_scalar_formatter()
  .set_use_offset(Some(ScalarNumber::Number(2.0)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Number(2.0)),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_69() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    use_offset=Some(ScalarNumber::NumpyFloat64(2.0)),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::NumpyFloat64(2.0)),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_70() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter
  .as_scalar_formatter()
  .set_use_offset(Some(ScalarNumber::NumpyFloat64(2.0)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::NumpyFloat64(2.0)),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_71() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    use_offset=Some(ScalarNumber::NumpyInt64(2L)),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::NumpyInt64(2L)),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_72() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter
  .as_scalar_formatter()
  .set_use_offset(Some(ScalarNumber::NumpyInt64(2L)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::NumpyInt64(2L)),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_73() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    use_offset=Some(ScalarNumber::NumpyBool(false)),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::NumpyBool(false)),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_74() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter
  .as_scalar_formatter()
  .set_use_offset(Some(ScalarNumber::NumpyBool(false)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::NumpyBool(false)),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_75() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    use_offset=Some(ScalarNumber::NumpyBool(true)),
  )
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::NumpyBool(true)),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_76() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter
  .as_scalar_formatter()
  .set_use_offset(Some(ScalarNumber::NumpyBool(true)))
  assert_eq(formatter.unit(), "")
  assert_eq(formatter.sep(), " ")
  eng_params_optional(formatter.places(), None)
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::NumpyBool(true)),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
  assert_eq(formatter.as_scalar_formatter().scientific(), true)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_77() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="",
    sep="",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00k")
}

///|
fn eng_params_case_78() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="",
    sep="",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$k")
}

///|
fn eng_params_case_79() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 k")
}

///|
fn eng_params_case_80() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ k")
}

///|
fn eng_params_case_81() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 k")
}

///|
fn eng_params_case_82() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ k")
}

///|
fn eng_params_case_83() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 k")
}

///|
fn eng_params_case_84() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ k")
}

///|
fn eng_params_case_85() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="Hz",
    sep="",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00kHz")
}

///|
fn eng_params_case_86() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="Hz",
    sep="",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$kHz")
}

///|
fn eng_params_case_87() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="Hz",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 kHz")
}

///|
fn eng_params_case_88() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="Hz",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ kHz")
}

///|
fn eng_params_case_89() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="Hz",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 kHz")
}

///|
fn eng_params_case_90() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="Hz",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ kHz")
}

///|
fn eng_params_case_91() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="Hz",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 kHz")
}

///|
fn eng_params_case_92() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="Hz",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ kHz")
}

///|
fn eng_params_case_93() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="-V",
    sep="",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00k−V")
}

///|
fn eng_params_case_94() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="-V",
    sep="",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$k−V")
}

///|
fn eng_params_case_95() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="-V",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 k−V")
}

///|
fn eng_params_case_96() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="-V",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ k−V")
}

///|
fn eng_params_case_97() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="-V",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 k−V")
}

///|
fn eng_params_case_98() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="-V",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ k−V")
}

///|
fn eng_params_case_99() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="-V",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 k−V")
}

///|
fn eng_params_case_100() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="-V",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ k−V")
}

///|
fn eng_params_case_101() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="$%_{}\\",
    sep="",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00k$%_{}\\")
}

///|
fn eng_params_case_102() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="$%_{}\\",
    sep="",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$k$%_{}\\")
}

///|
fn eng_params_case_103() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="$%_{}\\",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 k$%_{}\\")
}

///|
fn eng_params_case_104() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="$%_{}\\",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ k$%_{}\\")
}

///|
fn eng_params_case_105() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="$%_{}\\",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 k$%_{}\\")
}

///|
fn eng_params_case_106() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="$%_{}\\",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ k$%_{}\\")
}

///|
fn eng_params_case_107() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="$%_{}\\",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
  )
  assert_eq(formatter.call(-1000.0), "−1.00 k$%_{}\\")
}

///|
fn eng_params_case_108() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="$%_{}\\",
    sep=" ",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(true),
  )
  assert_eq(formatter.call(-1000.0), "$−1.00$ k$%_{}\\")
}

///|
fn eng_params_case_109() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_places_format(None), "g")
}

///|
fn eng_params_case_110() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_places_format(
      Some(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
    ),
    ".2f",
  )
}

///|
fn eng_params_case_111() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_places_format(
      Some(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
    ),
    ".-1f",
  )
}

///|
fn eng_params_case_112() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_places_format(Some(ScalarNumber::Boolean(false))), ".0f")
}

///|
fn eng_params_case_113() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_places_format(Some(ScalarNumber::Boolean(true))), ".1f")
}

///|
fn eng_params_case_114() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let message = try {
    ignore(eng_places_format(Some(ScalarNumber::Number(2.0))))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_115() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let message = try {
    ignore(eng_places_format(Some(ScalarNumber::NumpyFloat64(2.0))))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_116() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_places_format(Some(ScalarNumber::NumpyInt64(2L))), ".2f")
}

///|
fn eng_params_case_117() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_places_format(Some(ScalarNumber::NumpyBool(true))), ".1f")
}

///|
fn eng_params_case_118() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_places_format(Some(ScalarNumber::NumpyBool(false))), ".0f")
}

///|
fn eng_params_case_119() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let message = try {
    ignore(eng_places_format(Some(ScalarNumber::Integer(decimal_power(4300)))))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit",
  )
}

///|
fn eng_params_case_120() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let message = try {
    ignore(
      eng_places_format(Some(ScalarNumber::Integer(decimal_power(4300).neg()))),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit",
  )
}

///|
fn eng_params_case_121() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let message = try {
    ignore(eng_places_format(Some(ScalarNumber::Number(0.0 / 0.0))))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_122() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let message = try {
    ignore(eng_places_format(Some(ScalarNumber::Number(1.0 / 0.0))))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
fn eng_params_case_123() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: min() iterable argument is empty")
}

///|
fn eng_params_case_124() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: min() iterable argument is empty")
}

///|
fn eng_params_case_125() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000000000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: min() iterable argument is empty")
}

///|
fn eng_params_case_126() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_127() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1000")
}

///|
fn eng_params_case_128() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+09")
}

///|
fn eng_params_case_129() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("-3")), "m")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "KeyError: 0")
}

///|
fn eng_params_case_130() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("-3")), "m")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1 k")
}

///|
fn eng_params_case_131() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("-3")), "m")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+06 k")
}

///|
fn eng_params_case_132() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("6")), "M")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_133() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("6")), "M")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "KeyError: 3")
}

///|
fn eng_params_case_134() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("6")), "M")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1000 M")
}

///|
fn eng_params_case_135() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("1")), "one")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_136() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("1")), "one")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "100 one")
}

///|
fn eng_params_case_137() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("1")), "one")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+08 one")
}

///|
fn eng_params_case_138() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("2")), "two")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_139() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("2")), "two")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "10 two")
}

///|
fn eng_params_case_140() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("2")), "two")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+07 two")
}

///|
fn eng_params_case_141() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("4")), "four")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_142() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("4")), "four")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "KeyError: 3")
}

///|
fn eng_params_case_143() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("4")), "four")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "100000 four")
}

///|
fn eng_params_case_144() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Number(2.5), "frac")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_145() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Number(2.5), "frac")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "KeyError: 2")
}

///|
fn eng_params_case_146() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Number(2.5), "frac")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000000000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "KeyError: 2")
}

///|
fn eng_params_case_147() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(-2.5), "frac")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_148() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(-2.5), "frac")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1000")
}

///|
fn eng_params_case_149() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(-2.5), "frac")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+09")
}

///|
fn eng_params_case_150() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("2")), "two")
  prefixes.set(ScalarNumber::Number(2.5), "frac")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_151() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("2")), "two")
  prefixes.set(ScalarNumber::Number(2.5), "frac")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "3.16228 two")
}

///|
fn eng_params_case_152() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("2")), "two")
  prefixes.set(ScalarNumber::Number(2.5), "frac")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "3.16228e+06 two")
}

///|
fn eng_params_case_153() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(0.0), "")
  prefixes.set(ScalarNumber::Number(3.0), "K")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_154() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(0.0), "")
  prefixes.set(ScalarNumber::Number(3.0), "K")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1 K")
}

///|
fn eng_params_case_155() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(0.0), "")
  prefixes.set(ScalarNumber::Number(3.0), "K")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+06 K")
}

///|
fn eng_params_case_156() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Boolean(false), "false")
  prefixes.set(ScalarNumber::Boolean(true), "true")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0 false")
}

///|
fn eng_params_case_157() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Boolean(false), "false")
  prefixes.set(ScalarNumber::Boolean(true), "true")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "100 true")
}

///|
fn eng_params_case_158() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Boolean(false), "false")
  prefixes.set(ScalarNumber::Boolean(true), "true")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+08 true")
}

///|
fn eng_params_case_159() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyInt64(0L), "")
  prefixes.set(ScalarNumber::NumpyInt64(3L), "N")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_160() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyInt64(0L), "")
  prefixes.set(ScalarNumber::NumpyInt64(3L), "N")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1 N")
}

///|
fn eng_params_case_161() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyInt64(0L), "")
  prefixes.set(ScalarNumber::NumpyInt64(3L), "N")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+06 N")
}

///|
fn eng_params_case_162() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(0.0), "")
  prefixes.set(ScalarNumber::NumpyFloat64(3.0), "F")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_163() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(0.0), "")
  prefixes.set(ScalarNumber::NumpyFloat64(3.0), "F")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1 F")
}

///|
fn eng_params_case_164() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(0.0), "")
  prefixes.set(ScalarNumber::NumpyFloat64(3.0), "F")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+06 F")
}

///|
fn eng_params_case_165() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(-1.0 / 0.0), "lo")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_166() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(-1.0 / 0.0), "lo")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1 k")
}

///|
fn eng_params_case_167() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(-1.0 / 0.0), "lo")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+06 k")
}

///|
fn eng_params_case_168() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  prefixes.set(ScalarNumber::Number(1.0 / 0.0), "hi")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_169() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  prefixes.set(ScalarNumber::Number(1.0 / 0.0), "hi")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1 k")
}

///|
fn eng_params_case_170() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  prefixes.set(ScalarNumber::Number(1.0 / 0.0), "hi")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000000000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "KeyError: 9")
}

///|
fn eng_params_case_171() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(1.0 / 0.0), "hi")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_172() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(1.0 / 0.0), "hi")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_173() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(1.0 / 0.0), "hi")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000000000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_174() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(-1.0 / 0.0), "lo")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_175() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(-1.0 / 0.0), "lo")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_176() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(-1.0 / 0.0), "lo")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000000000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: cannot convert float infinity to integer")
}

///|
fn eng_params_case_177() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(0.0 / 0.0), "N")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_178() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(0.0 / 0.0), "N")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_179() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Number(0.0 / 0.0), "N")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000000000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "ValueError: cannot convert float NaN to integer")
}

///|
fn eng_params_case_180() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  prefixes.set(ScalarNumber::Number(0.0 / 0.0), "N")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_181() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  prefixes.set(ScalarNumber::Number(0.0 / 0.0), "N")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1 k")
}

///|
fn eng_params_case_182() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  prefixes.set(ScalarNumber::Number(0.0 / 0.0), "N")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+06 k")
}

///|
fn eng_params_case_183() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Number(0.0 / 0.0), "N")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_184() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Number(0.0 / 0.0), "N")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1 k")
}

///|
fn eng_params_case_185() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Number(0.0 / 0.0), "N")
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("3")), "k")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+06 k")
}

///|
fn eng_params_case_186() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
    "H",
  )
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_187() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
    "H",
  )
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "KeyError: 3")
}

///|
fn eng_params_case_188() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
    "H",
  )
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000000000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "KeyError: 9")
}

///|
fn eng_params_case_189() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
    "H",
  )
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_190() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
    "H",
  )
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000.0), "1000")
}

///|
fn eng_params_case_191() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
    "H",
  )
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(1000000000.0), "1e+09")
}

///|
fn eng_params_case_192() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Number(1.0e+300), "H")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  assert_eq(formatter.format_data(0.0), "0")
}

///|
fn eng_params_case_193() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Number(1.0e+300), "H")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "KeyError: 3")
}

///|
fn eng_params_case_194() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::Integer(@bigint.BigInt::from_string("0")), "")
  prefixes.set(ScalarNumber::Number(1.0e+300), "H")
  let formatter = EngFormatter::new()
  formatter.set_prefixes(prefixes)
  let message = try {
    ignore(formatter.format_data(1000000000.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "KeyError: 9")
}

///|
fn eng_params_case_195() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::Number(0.0)), 0L)
}

///|
fn eng_params_case_196() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::Number(-0.0)), 0L)
}

///|
fn eng_params_case_197() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::Number(1.5)), 1152921504606846977L)
}

///|
fn eng_params_case_198() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::Number(-1.0)), -2L)
}

///|
fn eng_params_case_199() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::Number(1.0 / 0.0)), 314159L)
}

///|
fn eng_params_case_200() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::Number(-1.0 / 0.0)), -314159L)
}

///|
fn eng_params_case_201() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(1.0e-300)),
    482449582752280463L,
  )
}

///|
fn eng_params_case_202() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(1.0e+300)),
    1224995262755759164L,
  )
}

///|
fn eng_params_case_203() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::NumpyFloat64(1.5)),
    1152921504606846977L,
  )
}

///|
fn eng_params_case_204() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::NumpyFloat64(1.0 / 0.0)), 314159L)
}

///|
fn eng_params_case_205() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::NumpyInt64(-1L)), -2L)
}

///|
fn eng_params_case_206() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::NumpyBool(true)), 1L)
}

///|
fn eng_params_case_207() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::Boolean(true)), 1L)
}

///|
fn eng_params_case_208() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::Boolean(false)), 0L)
}

///|
fn eng_params_case_209() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(
      ScalarNumber::Integer(@bigint.BigInt::from_string("9007199254740993")),
    ),
    9007199254740993L,
  )
}

///|
fn eng_params_case_210() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(
      ScalarNumber::Integer(@bigint.BigInt::from_string("-9223372036854775808")),
    ),
    -4L,
  )
}

///|
fn eng_params_case_211() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915872903807060280344576"),
      ),
    ),
    576460752303423488L,
  )
}

///|
fn eng_params_case_212() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
    477640439047194790L,
  )
}

///|
fn eng_params_case_213() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
    -477640439047194790L,
  )
}

///|
fn eng_params_case_214() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(eng_prefix_hash(ScalarNumber::Number(1.0e-322)), 335544320L)
}

///|
fn eng_params_case_215() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(1.1521772964244953e-301)),
    1618833129484879128L,
  )
}

///|
fn eng_params_case_216() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(5.35408475421076e-19)),
    540876729627163137L,
  )
}

///|
fn eng_params_case_217() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(1.070816950842152e-18)),
    1081753459254326274L,
  )
}

///|
fn eng_params_case_218() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(0.617283945061725)),
    1423359869420428544L,
  )
}

///|
fn eng_params_case_219() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(1.23456789012345)),
    540876729627163137L,
  )
}

///|
fn eng_params_case_220() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(2.4691357802469)),
    1081753459254326274L,
  )
}

///|
fn eng_params_case_221() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(1.4233598694204285e+18)),
    1423359869420428544L,
  )
}

///|
fn eng_params_case_222() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(2.846719738840857e+18)),
    540876729627163137L,
  )
}

///|
fn eng_params_case_223() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(4.0412229363402574e+150)),
    1821795707714016192L,
  )
}

///|
fn eng_params_case_224() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  assert_eq(
    eng_prefix_hash(ScalarNumber::Number(1.3228501204230667e+301)),
    367240981096696996L,
  )
}

///|
fn eng_params_case_225() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(9007199254740992.0))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("9007199254740993")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyFloat64(9007199254740992.0),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9007199254740993")),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_226() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("9007199254740993")),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(9007199254740992.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("9007199254740993")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyFloat64(9007199254740992.0),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_227() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(9007199254740992.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(9007199254740993L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyFloat64(9007199254740992.0),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyInt64(9007199254740993L),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_228() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(9007199254740993L))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(9007199254740992.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyInt64(9007199254740993L),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyFloat64(9007199254740992.0),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_229() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(9007199254740992.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(9007199254740993L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(9007199254740992.0))
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyInt64(9007199254740993L),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_230() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(9007199254740993L))
  let last = EngPrefixKey::new(ScalarNumber::Number(9007199254740992.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyInt64(9007199254740993L),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(keys[1].value(), ScalarNumber::Number(9007199254740992.0))
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_231() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::NumpyFloat64(9.223372036854776e+18),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(9223372036854775807L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyFloat64(9.223372036854776e+18),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_232() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(9223372036854775807L))
  let last = EngPrefixKey::new(
    ScalarNumber::NumpyFloat64(9.223372036854776e+18),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyFloat64(9.223372036854776e+18),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_233() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(9.223372036854776e+18))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(9223372036854775807L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Number(9.223372036854776e+18),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_234() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(9223372036854775807L))
  let last = EngPrefixKey::new(ScalarNumber::Number(9.223372036854776e+18))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyInt64(9223372036854775807L),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::Number(9.223372036854776e+18),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_235() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::NumpyFloat64(-9.223372036854776e+18),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(-9223372036854775807L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyFloat64(-9.223372036854776e+18),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyInt64(-9223372036854775807L),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_236() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(-9223372036854775807L))
  let last = EngPrefixKey::new(
    ScalarNumber::NumpyFloat64(-9.223372036854776e+18),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyInt64(-9223372036854775807L),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyFloat64(-9.223372036854776e+18),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_237() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::NumpyFloat64(1.0384593717069655e+34),
  )
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("10384593717069657562904001872134143"),
    ),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyFloat64(1.0384593717069655e+34),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("10384593717069657562904001872134143"),
    ),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_238() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("10384593717069657562904001872134143"),
    ),
  )
  let last = EngPrefixKey::new(
    ScalarNumber::NumpyFloat64(1.0384593717069655e+34),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("10384593717069657562904001872134143"),
    ),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyFloat64(1.0384593717069655e+34),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_239() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(1.0384593717069655e+34))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("10384593717069657562904001872134143"),
    ),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Number(1.0384593717069655e+34),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("10384593717069657562904001872134143"),
    ),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_240() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("10384593717069657562904001872134143"),
    ),
  )
  let last = EngPrefixKey::new(ScalarNumber::Number(1.0384593717069655e+34))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("10384593717069657562904001872134143"),
    ),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::Number(1.0384593717069655e+34),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_241() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::NumpyFloat64(-1.0384593717069655e+34),
  )
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("-10384593717069657562904001872134143"),
    ),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyFloat64(-1.0384593717069655e+34),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("-10384593717069657562904001872134143"),
    ),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_242() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("-10384593717069657562904001872134143"),
    ),
  )
  let last = EngPrefixKey::new(
    ScalarNumber::NumpyFloat64(-1.0384593717069655e+34),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("-10384593717069657562904001872134143"),
    ),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::NumpyFloat64(-1.0384593717069655e+34),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_243() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::NumpyFloat64(1.329227995784916e+36),
  )
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("1329227995784915902879766180058365939"),
    ),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::NumpyFloat64(1.329227995784916e+36),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_244() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("1329227995784915902879766180058365939"),
    ),
  )
  let last = EngPrefixKey::new(
    ScalarNumber::NumpyFloat64(1.329227995784916e+36),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("1329227995784915902879766180058365939"),
    ),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_245() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(1L))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("2305843009213693952")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(1L))
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("2305843009213693952")),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_246() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("2305843009213693952")),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(1L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("2305843009213693952")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(keys[1].value(), ScalarNumber::NumpyInt64(1L))
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_247() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("2305843009213693952")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("2305843009213693952")),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_248() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("2305843009213693952")),
  )
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("2305843009213693952")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_249() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(1.0e+100))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000159028911097599180468360808563945281389781327557747838772170381063119312995070509055",
      ),
    ),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(1.0e+100))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_250() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000159028911097599180468360808563945281389781327557747838772170381063119312995070509055",
      ),
    ),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(1.0e+100))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000159028911097599180468360808563945281389781327557747838772170381063119312995070509055",
      ),
    ),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_251() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(1.0e+100))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000159028911097599180468360808563945281389781327557747838772170381063119312995070509055",
      ),
    ),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(1.0e+100))
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(
    keys[1].value(),
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000159028911097599180468360808563945281389781327557747838772170381063119312995070509055",
      ),
    ),
  )
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_252() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000159028911097599180468360808563945281389781327557747838772170381063119312995070509055",
      ),
    ),
  )
  let last = EngPrefixKey::new(ScalarNumber::Number(1.0e+100))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 2)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000159028911097599180468360808563945281389781327557747838772170381063119312995070509055",
      ),
    ),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("first"))
  eng_params_number(keys[1].value(), ScalarNumber::Number(1.0e+100))
  assert_eq(prefixes.get_key(keys[1]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_253() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_254() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_255() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_256() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_257() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_258() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_259() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_260() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_261() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_262() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_263() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_264() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_265() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_266() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_267() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_268() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_269() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_270() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_271() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_272() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_273() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_274() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_275() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_276() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_277() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_278() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_279() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_280() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_281() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_282() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_283() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_284() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_285() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_286() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_287() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_288() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_289() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_290() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_291() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_292() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_293() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_294() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_295() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_296() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_297() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_298() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_299() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_300() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_301() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_302() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_303() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_304() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_305() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_306() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_307() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_308() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_309() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_310() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_311() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_312() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_313() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_314() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(
    keys[0].value(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_315() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(ScalarNumber::Number(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_316() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Number(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Number(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_317() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(ScalarNumber::Boolean(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_318() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::Boolean(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::Boolean(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_319() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_320() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyInt64(0L))
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyInt64(0L))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_321() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_322() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0))
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyFloat64(0.0))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_323() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_324() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let first = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  let last = EngPrefixKey::new(ScalarNumber::NumpyBool(false))
  prefixes.set_key(first, "first")
  prefixes.set_key(last, "last")
  assert_eq(prefixes.length(), 1)
  let keys = prefixes.keys()
  eng_params_number(keys[0].value(), ScalarNumber::NumpyBool(false))
  assert_eq(prefixes.get_key(keys[0]), Some("last"))
  assert_true(physical_equal(keys[0], first))
  assert_eq(prefixes.get_key(last), Some("last"))
  assert_true(prefixes.remove_key(last))
  assert_eq(prefixes.length(), 0)
}

///|
fn eng_params_case_325() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(1.0), "first")
  let message = try {
    ignore(
      prefixes.set(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
          ),
        ),
        "last",
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_326() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(1.0), "first")
  let message = try {
    ignore(
      prefixes.get(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_327() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(1.0), "first")
  let message = try {
    ignore(
      prefixes.remove(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_328() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.set(ScalarNumber::NumpyFloat64(1.0), "last"))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_329() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.get(ScalarNumber::NumpyFloat64(1.0)))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_330() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.remove(ScalarNumber::NumpyFloat64(1.0)))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_331() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(1.0 / 0.0), "first")
  let message = try {
    ignore(
      prefixes.set(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
          ),
        ),
        "last",
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_332() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(1.0 / 0.0), "first")
  let message = try {
    ignore(
      prefixes.get(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_333() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(1.0 / 0.0), "first")
  let message = try {
    ignore(
      prefixes.remove(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_334() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.set(ScalarNumber::NumpyFloat64(1.0 / 0.0), "last"))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_335() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.get(ScalarNumber::NumpyFloat64(1.0 / 0.0)))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_336() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.remove(ScalarNumber::NumpyFloat64(1.0 / 0.0)))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_337() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(-1.0 / 0.0), "first")
  let message = try {
    ignore(
      prefixes.set(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "-9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
          ),
        ),
        "last",
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_338() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(-1.0 / 0.0), "first")
  let message = try {
    ignore(
      prefixes.get(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "-9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_339() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyFloat64(-1.0 / 0.0), "first")
  let message = try {
    ignore(
      prefixes.remove(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "-9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_340() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "-9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.set(ScalarNumber::NumpyFloat64(-1.0 / 0.0), "last"))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_341() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "-9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.get(ScalarNumber::NumpyFloat64(-1.0 / 0.0)))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_342() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "-9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.remove(ScalarNumber::NumpyFloat64(-1.0 / 0.0)))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_343() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyBool(true), "first")
  let message = try {
    ignore(
      prefixes.set(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
          ),
        ),
        "last",
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: Python int too large to convert to C long")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_344() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyBool(true), "first")
  let message = try {
    ignore(
      prefixes.get(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: Python int too large to convert to C long")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_345() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(ScalarNumber::NumpyBool(true), "first")
  let message = try {
    ignore(
      prefixes.remove(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: Python int too large to convert to C long")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_346() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.set(ScalarNumber::NumpyBool(true), "last"))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: Python int too large to convert to C long")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_347() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.get(ScalarNumber::NumpyBool(true)))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: Python int too large to convert to C long")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_348() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
      ),
    ),
    "first",
  )
  let message = try {
    ignore(prefixes.remove(ScalarNumber::NumpyBool(true)))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: Python int too large to convert to C long")
  assert_eq(prefixes.length(), 1)
}

///|
fn eng_params_case_349() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let a = EngPrefixKey::new(ScalarNumber::Number(0.0 / 0.0))
  let b = EngPrefixKey::new(ScalarNumber::Number(0.0 / 0.0))
  let prefixes = EngPrefixes::new()
  prefixes.set_key(a, "first")
  prefixes.set_key(a, "same")
  prefixes.set_key(b, "different")
  assert_eq(prefixes.length(), 2)
  assert_eq(prefixes.get_key(a), Some("same"))
  assert_eq(prefixes.get_key(b), Some("different"))
  assert_eq(prefixes.get(ScalarNumber::Number(0.0 / 0.0)), None)
  let copied = prefixes.copy()
  assert_true(physical_equal(prefixes.keys()[0], copied.keys()[0]))
  prefixes.set_key(a, "changed")
  assert_eq(copied.get_key(a), Some("same"))
  assert_true(copied.remove_key(a))
  assert_eq(prefixes.length(), 2)
  assert_eq(copied.length(), 1)
}

///|
fn eng_params_case_350() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  let other = EngFormatter::new()
  let copied = formatter.copy()
  formatter
  .prefixes()
  .set(ScalarNumber::Integer(@bigint.BigInt::from_int(3)), "K!")
  assert_eq([formatter.call(1000.0), other.call(1000.0), copied.call(1000.0)], [
    "1 K!", "1 K!", "1 K!",
  ])

  let class_map = EngPrefixes::new()
  class_map.set(ScalarNumber::Integer(@bigint.BigInt::from_int(0)), "C")
  class_map.set(ScalarNumber::Integer(@bigint.BigInt::from_int(3)), "CLASS")
  EngFormatter::set_class_prefixes(class_map)
  assert_eq([formatter.call(1000.0), other.call(1000.0), copied.call(1000.0)], [
    "1 CLASS", "1 CLASS", "1 CLASS",
  ])

  let instance = EngPrefixes::new()
  instance.set(ScalarNumber::Integer(@bigint.BigInt::from_int(0)), "")
  instance.set(ScalarNumber::Integer(@bigint.BigInt::from_int(3)), "INSTANCE")
  formatter.set_prefixes(instance)
  let local_copy = formatter.copy()
  instance.set(ScalarNumber::Integer(@bigint.BigInt::from_int(3)), "MUT")
  assert_eq([formatter.call(1000.0), local_copy.call(1000.0)], [
    "1 MUT", "1 MUT",
  ])

  let rebound = EngPrefixes::new()
  rebound.set(ScalarNumber::Integer(@bigint.BigInt::from_int(0)), "")
  rebound.set(ScalarNumber::Integer(@bigint.BigInt::from_int(3)), "REBOUND")
  formatter.set_prefixes(rebound)
  assert_eq([formatter.call(1000.0), local_copy.call(1000.0)], [
    "1 REBOUND", "1 MUT",
  ])

  formatter.clear_prefixes()
  assert_eq([formatter.call(1000.0), local_copy.call(1000.0)], [
    "1 CLASS", "1 MUT",
  ])
}

///|
fn eng_params_case_351() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("1329227995784915872903807060280344576"),
    ),
    "A",
  )
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("1329227995784915875209650069494038527"),
    ),
    "B",
  )
  assert_true(
    prefixes.remove(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915872903807060280344576"),
      ),
    ),
  )
  prefixes.set(
    ScalarNumber::Integer(
      @bigint.BigInt::from_string("1329227995784915870597964051066650625"),
    ),
    "D",
  )
  let keys = prefixes.keys()
  assert_eq([prefixes.get_key(keys[0]), prefixes.get_key(keys[1])], [
    Some("B"),
    Some("D"),
  ])
  assert_eq(
    prefixes.get(ScalarNumber::NumpyFloat64(1.329227995784916e+36)).unwrap(),
    "D",
  )
  assert_eq(
    prefixes
    .copy()
    .get(ScalarNumber::NumpyFloat64(1.329227995784916e+36))
    .unwrap(),
    "D",
  )
}

///|
fn eng_params_case_352() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  let scalar = formatter.as_scalar_formatter()
  scalar.set_usetex(None)
  let first = scalar.get_usetex()
  @config.set_text_usetex(true)
  let before = scalar.get_usetex()
  scalar.set_usetex(None)
  assert_eq([first, before, scalar.get_usetex()], [false, false, true])
}

///|
fn eng_params_case_353() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  let scalar = formatter.as_scalar_formatter()
  scalar.set_use_math_text(None)
  let first = scalar.get_use_math_text()
  @config.set_formatter_use_math_text(true)
  let before = scalar.get_use_math_text()
  scalar.set_use_math_text(None)
  assert_eq([first, before, scalar.get_use_math_text()], [false, false, true])
}

///|
fn eng_params_case_354() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  let scalar = formatter.as_scalar_formatter()
  scalar.set_use_locale(None)
  let first = scalar.get_use_locale()
  @config.set_formatter_use_locale(true)
  let before = scalar.get_use_locale()
  scalar.set_use_locale(None)
  assert_eq([first, before, scalar.get_use_locale()], [false, false, true])
}

///|
fn eng_params_case_355() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(
    unit="V",
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(1))),
    sep=":",
  )
  formatter.create_dummy_axis()
  let locations = [1.0]
  formatter.set_locs(locations)
  let scalar = formatter.as_scalar_formatter()
  scalar.set_format_pattern("%.1f")
  scalar.set_order_of_magnitude(
    ScalarNumber::Integer(@bigint.BigInt::from_int(3)),
  )
  scalar.set_scientific(false)
  let limits = [@bigint.BigInt::from_int(4), @bigint.BigInt::from_int(4)]
  scalar.set_power_limits(ScalarPowerLimits::Integers(limits))
  let copied = formatter.copy()
  copied.set_unit("copy")
  copied.set_places(None)
  copied.set_sep("~")
  copied
  .as_scalar_formatter()
  .set_use_offset(Some(ScalarNumber::Integer(@bigint.BigInt::from_int(12))))
  copied.as_scalar_formatter().set_format_pattern("%g")
  locations.push(2.0)
  limits[0] = @bigint.BigInt::from_int(9)
  assert_true(
    physical_equal(formatter.as_base_formatter(), scalar.as_base_formatter()),
  )
  assert_true(
    !physical_equal(formatter.as_base_formatter(), copied.as_base_formatter()),
  )
  assert_eq(formatter.axis(), copied.axis())
  assert_eq(copied.locations().get(1), 2.0)
  match copied.as_scalar_formatter().power_limits() {
    Integers(values) => assert_eq(values[0], @bigint.BigInt::from_int(9))
    _ => fail("lost shared inherited limits")
  }
  assert_eq(formatter.unit(), "V")
  assert_eq(formatter.sep(), ":")
  eng_params_optional(
    formatter.places(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
  eng_params_optional(
    formatter.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.as_scalar_formatter().get_use_offset(), false)
  assert_eq(formatter.as_scalar_formatter().get_usetex(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(formatter.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    formatter.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "%.1f")
  assert_eq(formatter.as_scalar_formatter().scientific(), false)
  assert_eq(
    formatter.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
  assert_eq(copied.unit(), "copy")
  assert_eq(copied.sep(), "~")
  eng_params_optional(copied.places(), None)
  eng_params_optional(
    copied.as_scalar_formatter().offset(),
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("12"))),
  )
  assert_eq(copied.as_scalar_formatter().get_use_offset(), false)
  assert_eq(copied.as_scalar_formatter().get_usetex(), false)
  assert_eq(copied.as_scalar_formatter().get_use_math_text(), false)
  assert_eq(copied.as_scalar_formatter().get_use_locale(), false)
  eng_params_number(
    copied.as_scalar_formatter().order_of_magnitude(),
    ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(copied.as_scalar_formatter().format_pattern(), "%g")
  assert_eq(copied.as_scalar_formatter().scientific(), false)
  assert_eq(
    copied.as_scalar_formatter().offset_threshold(),
    @bigint.BigInt::from_string("4"),
  )
}

///|
fn eng_params_case_356() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter.create_dummy_axis()
  formatter.set_locs([])
  let scalar = formatter.as_scalar_formatter()
  scalar.set_offset(
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("3"))),
  )
  scalar.set_format_pattern("%.2f")
  scalar.set_order_of_magnitude(
    ScalarNumber::Integer(@bigint.BigInt::from_int(0)),
  )
  assert_eq(formatter.call(1.0), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn eng_params_case_357() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter.create_dummy_axis()
  formatter.set_locs([1.0])
  let scalar = formatter.as_scalar_formatter()
  scalar.set_offset(
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  scalar.set_format_pattern("%.2f")
  scalar.set_order_of_magnitude(
    ScalarNumber::Integer(@bigint.BigInt::from_int(0)),
  )
  assert_eq(formatter.call(1.0), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn eng_params_case_358() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter.create_dummy_axis()
  formatter.set_locs([1.0])
  let scalar = formatter.as_scalar_formatter()
  scalar.set_offset(
    Some(ScalarNumber::Integer(@bigint.BigInt::from_string("3"))),
  )
  scalar.set_format_pattern("%.2f")
  scalar.set_order_of_magnitude(
    ScalarNumber::Integer(@bigint.BigInt::from_int(0)),
  )
  assert_eq(formatter.call(1.0), "−2.00")
  assert_eq(formatter.get_offset(), "1+3")
}

///|
fn eng_params_case_359() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter.create_dummy_axis()
  formatter.set_locs([])
  let scalar = formatter.as_scalar_formatter()
  scalar.set_offset(None)
  scalar.set_format_pattern("%.2f")
  scalar.set_order_of_magnitude(
    ScalarNumber::Integer(@bigint.BigInt::from_int(0)),
  )
  assert_eq(formatter.call(1.0), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn eng_params_case_360() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new()
  formatter.create_dummy_axis()
  formatter.set_locs([1.0])
  let scalar = formatter.as_scalar_formatter()
  scalar.set_offset(None)
  scalar.set_format_pattern("%.2f")
  scalar.set_order_of_magnitude(
    ScalarNumber::Integer(@bigint.BigInt::from_int(0)),
  )
  let message = try {
    ignore(formatter.call(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    message, "TypeError: unsupported operand type(s) for -: 'float' and 'NoneType'",
  )
  assert_eq(formatter.get_offset(), "")
}

///|
fn eng_params_case_361() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(unit="V")
  formatter.create_dummy_axis()
  assert_eq(
    formatter.format_data_short_value(
      ScalarNumber::Integer(@bigint.BigInt::from_string("1000")),
    ),
    "1000",
  )
}

///|
fn eng_params_case_362() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(unit="V")
  formatter.create_dummy_axis()
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyInt64(1000L)),
    "1000",
  )
}

///|
fn eng_params_case_363() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let formatter = EngFormatter::new(unit="V")
  formatter.create_dummy_axis()
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::Number(1000.0)),
    "1000.0000",
  )
}

///|
fn eng_params_case_364() -> Unit raise {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let previous_prefixes = EngFormatter::class_prefixes()
  defer EngFormatter::set_class_prefixes(previous_prefixes)
  EngFormatter::set_class_prefixes(EngPrefixes::si())
  let prefixes = EngPrefixes::new()
  let key = EngPrefixKey::new(ScalarNumber::NumpyFloat64(0.0 / 0.0))
  assert_eq(key.numeric_hash, 0L)
  prefixes.set_key(key, "nan")
  let message = try {
    ignore(
      prefixes.set(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805210",
          ),
        ),
        "huge",
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "OverflowError: int too large to convert to float")
  assert_eq(prefixes.length(), 1)
  assert_true(prefixes.length() != 2)
}

///|
test "Eng params original group 0" {
  eng_params_case_0()
  eng_params_case_1()
  eng_params_case_2()
  eng_params_case_3()
  eng_params_case_4()
  eng_params_case_5()
  eng_params_case_6()
  eng_params_case_7()
  eng_params_case_8()
  eng_params_case_9()
  eng_params_case_10()
  eng_params_case_11()
  eng_params_case_12()
  eng_params_case_13()
  eng_params_case_14()
  eng_params_case_15()
  eng_params_case_16()
  eng_params_case_17()
  eng_params_case_18()
  eng_params_case_19()
  eng_params_case_20()
  eng_params_case_21()
  eng_params_case_22()
  eng_params_case_23()
  eng_params_case_24()
  eng_params_case_25()
  eng_params_case_26()
  eng_params_case_27()
  eng_params_case_28()
  eng_params_case_29()
  eng_params_case_30()
  eng_params_case_31()
}

///|
test "Eng params original group 1" {
  eng_params_case_32()
  eng_params_case_33()
  eng_params_case_34()
  eng_params_case_35()
  eng_params_case_36()
  eng_params_case_37()
  eng_params_case_38()
  eng_params_case_39()
  eng_params_case_40()
  eng_params_case_41()
  eng_params_case_42()
  eng_params_case_43()
  eng_params_case_44()
  eng_params_case_45()
  eng_params_case_46()
  eng_params_case_47()
  eng_params_case_48()
  eng_params_case_49()
  eng_params_case_50()
  eng_params_case_51()
  eng_params_case_52()
  eng_params_case_53()
  eng_params_case_54()
  eng_params_case_55()
  eng_params_case_56()
  eng_params_case_57()
  eng_params_case_58()
  eng_params_case_59()
  eng_params_case_60()
  eng_params_case_61()
  eng_params_case_62()
  eng_params_case_63()
}

///|
test "Eng params original group 2" {
  eng_params_case_64()
  eng_params_case_65()
  eng_params_case_66()
  eng_params_case_67()
  eng_params_case_68()
  eng_params_case_69()
  eng_params_case_70()
  eng_params_case_71()
  eng_params_case_72()
  eng_params_case_73()
  eng_params_case_74()
  eng_params_case_75()
  eng_params_case_76()
  eng_params_case_77()
  eng_params_case_78()
  eng_params_case_79()
  eng_params_case_80()
  eng_params_case_81()
  eng_params_case_82()
  eng_params_case_83()
  eng_params_case_84()
  eng_params_case_85()
  eng_params_case_86()
  eng_params_case_87()
  eng_params_case_88()
  eng_params_case_89()
  eng_params_case_90()
  eng_params_case_91()
  eng_params_case_92()
  eng_params_case_93()
  eng_params_case_94()
  eng_params_case_95()
}

///|
test "Eng params original group 3" {
  eng_params_case_96()
  eng_params_case_97()
  eng_params_case_98()
  eng_params_case_99()
  eng_params_case_100()
  eng_params_case_101()
  eng_params_case_102()
  eng_params_case_103()
  eng_params_case_104()
  eng_params_case_105()
  eng_params_case_106()
  eng_params_case_107()
  eng_params_case_108()
  eng_params_case_109()
  eng_params_case_110()
  eng_params_case_111()
  eng_params_case_112()
  eng_params_case_113()
  eng_params_case_114()
  eng_params_case_115()
  eng_params_case_116()
  eng_params_case_117()
  eng_params_case_118()
  eng_params_case_119()
  eng_params_case_120()
  eng_params_case_121()
  eng_params_case_122()
  eng_params_case_123()
  eng_params_case_124()
  eng_params_case_125()
  eng_params_case_126()
  eng_params_case_127()
}

///|
test "Eng params original group 4" {
  eng_params_case_128()
  eng_params_case_129()
  eng_params_case_130()
  eng_params_case_131()
  eng_params_case_132()
  eng_params_case_133()
  eng_params_case_134()
  eng_params_case_135()
  eng_params_case_136()
  eng_params_case_137()
  eng_params_case_138()
  eng_params_case_139()
  eng_params_case_140()
  eng_params_case_141()
  eng_params_case_142()
  eng_params_case_143()
  eng_params_case_144()
  eng_params_case_145()
  eng_params_case_146()
  eng_params_case_147()
  eng_params_case_148()
  eng_params_case_149()
  eng_params_case_150()
  eng_params_case_151()
  eng_params_case_152()
  eng_params_case_153()
  eng_params_case_154()
  eng_params_case_155()
  eng_params_case_156()
  eng_params_case_157()
  eng_params_case_158()
  eng_params_case_159()
}

///|
test "Eng params original group 5" {
  eng_params_case_160()
  eng_params_case_161()
  eng_params_case_162()
  eng_params_case_163()
  eng_params_case_164()
  eng_params_case_165()
  eng_params_case_166()
  eng_params_case_167()
  eng_params_case_168()
  eng_params_case_169()
  eng_params_case_170()
  eng_params_case_171()
  eng_params_case_172()
  eng_params_case_173()
  eng_params_case_174()
  eng_params_case_175()
  eng_params_case_176()
  eng_params_case_177()
  eng_params_case_178()
  eng_params_case_179()
  eng_params_case_180()
  eng_params_case_181()
  eng_params_case_182()
  eng_params_case_183()
  eng_params_case_184()
  eng_params_case_185()
  eng_params_case_186()
  eng_params_case_187()
  eng_params_case_188()
  eng_params_case_189()
  eng_params_case_190()
  eng_params_case_191()
}

///|
test "Eng params original group 6" {
  eng_params_case_192()
  eng_params_case_193()
  eng_params_case_194()
  eng_params_case_195()
  eng_params_case_196()
  eng_params_case_197()
  eng_params_case_198()
  eng_params_case_199()
  eng_params_case_200()
  eng_params_case_201()
  eng_params_case_202()
  eng_params_case_203()
  eng_params_case_204()
  eng_params_case_205()
  eng_params_case_206()
  eng_params_case_207()
  eng_params_case_208()
  eng_params_case_209()
  eng_params_case_210()
  eng_params_case_211()
  eng_params_case_212()
  eng_params_case_213()
  eng_params_case_214()
  eng_params_case_215()
  eng_params_case_216()
  eng_params_case_217()
  eng_params_case_218()
  eng_params_case_219()
  eng_params_case_220()
  eng_params_case_221()
  eng_params_case_222()
  eng_params_case_223()
}

///|
test "Eng params original group 7" {
  eng_params_case_224()
  eng_params_case_225()
  eng_params_case_226()
  eng_params_case_227()
  eng_params_case_228()
  eng_params_case_229()
  eng_params_case_230()
  eng_params_case_231()
  eng_params_case_232()
  eng_params_case_233()
  eng_params_case_234()
  eng_params_case_235()
  eng_params_case_236()
  eng_params_case_237()
  eng_params_case_238()
  eng_params_case_239()
  eng_params_case_240()
  eng_params_case_241()
  eng_params_case_242()
  eng_params_case_243()
  eng_params_case_244()
  eng_params_case_245()
  eng_params_case_246()
  eng_params_case_247()
  eng_params_case_248()
  eng_params_case_249()
  eng_params_case_250()
  eng_params_case_251()
  eng_params_case_252()
  eng_params_case_253()
  eng_params_case_254()
  eng_params_case_255()
}

///|
test "Eng params original group 8" {
  eng_params_case_256()
  eng_params_case_257()
  eng_params_case_258()
  eng_params_case_259()
  eng_params_case_260()
  eng_params_case_261()
  eng_params_case_262()
  eng_params_case_263()
  eng_params_case_264()
  eng_params_case_265()
  eng_params_case_266()
  eng_params_case_267()
  eng_params_case_268()
  eng_params_case_269()
  eng_params_case_270()
  eng_params_case_271()
  eng_params_case_272()
  eng_params_case_273()
  eng_params_case_274()
  eng_params_case_275()
  eng_params_case_276()
  eng_params_case_277()
  eng_params_case_278()
  eng_params_case_279()
  eng_params_case_280()
  eng_params_case_281()
  eng_params_case_282()
  eng_params_case_283()
  eng_params_case_284()
  eng_params_case_285()
  eng_params_case_286()
  eng_params_case_287()
}

///|
test "Eng params original group 9" {
  eng_params_case_288()
  eng_params_case_289()
  eng_params_case_290()
  eng_params_case_291()
  eng_params_case_292()
  eng_params_case_293()
  eng_params_case_294()
  eng_params_case_295()
  eng_params_case_296()
  eng_params_case_297()
  eng_params_case_298()
  eng_params_case_299()
  eng_params_case_300()
  eng_params_case_301()
  eng_params_case_302()
  eng_params_case_303()
  eng_params_case_304()
  eng_params_case_305()
  eng_params_case_306()
  eng_params_case_307()
  eng_params_case_308()
  eng_params_case_309()
  eng_params_case_310()
  eng_params_case_311()
  eng_params_case_312()
  eng_params_case_313()
  eng_params_case_314()
  eng_params_case_315()
  eng_params_case_316()
  eng_params_case_317()
  eng_params_case_318()
  eng_params_case_319()
}

///|
test "Eng params original group 10" {
  eng_params_case_320()
  eng_params_case_321()
  eng_params_case_322()
  eng_params_case_323()
  eng_params_case_324()
  eng_params_case_325()
  eng_params_case_326()
  eng_params_case_327()
  eng_params_case_328()
  eng_params_case_329()
  eng_params_case_330()
  eng_params_case_331()
  eng_params_case_332()
  eng_params_case_333()
  eng_params_case_334()
  eng_params_case_335()
  eng_params_case_336()
  eng_params_case_337()
  eng_params_case_338()
  eng_params_case_339()
  eng_params_case_340()
  eng_params_case_341()
  eng_params_case_342()
  eng_params_case_343()
  eng_params_case_344()
  eng_params_case_345()
  eng_params_case_346()
  eng_params_case_347()
  eng_params_case_348()
  eng_params_case_349()
  eng_params_case_350()
  eng_params_case_351()
}

///|
test "Eng params original group 11" {
  eng_params_case_352()
  eng_params_case_353()
  eng_params_case_354()
  eng_params_case_355()
  eng_params_case_356()
  eng_params_case_357()
  eng_params_case_358()
  eng_params_case_359()
  eng_params_case_360()
  eng_params_case_361()
  eng_params_case_362()
  eng_params_case_363()
  eng_params_case_364()
}
