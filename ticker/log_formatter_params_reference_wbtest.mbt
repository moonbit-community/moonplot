// Complete pinned LogFormatter family and real helpers. Whitebox cache fixtures
// are private source-state observations, not a public raw set mutation API.

///|
fn log_params_value(actual : LogValue, expected : LogValue) -> Unit raise {
  match (actual, expected) {
    (Numeric(ScalarNumber::Number(a)), Numeric(ScalarNumber::Number(b)))
    | (
      Numeric(ScalarNumber::NumpyFloat64(a)),
      Numeric(ScalarNumber::NumpyFloat64(b)),
    ) =>
      if b.is_nan() {
        assert_true(a.is_nan())
      } else {
        assert_eq(a.reinterpret_as_uint64(), b.reinterpret_as_uint64())
      }
    _ => assert_eq(actual, expected)
  }
}

///|
fn log_params_case_0() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("10")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_1() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("10"))),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_2() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_3() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(10.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_4() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::NumpyFloat64(10.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_5() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyFloat64(10.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_6() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::NumpyInt64(10L)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_7() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyInt64(10L)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_8() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_9() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Boolean(false)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_10() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_11() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Boolean(true)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_12() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_13() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_14() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatter::new(base=LogValue::NoneValue))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: float() argument must be a string or a real number, not 'NoneType'",
  )
}

///|
fn log_params_case_15() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::NoneValue))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: float() argument must be a string or a real number, not 'NoneType'",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_16() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_17() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_18() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_19() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_20() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_21() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-2.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_22() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_23() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(1.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_24() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_25() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.5)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_26() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_27() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_28() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_29() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_30() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_31() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_32() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(
      LogFormatter::new(
        base=LogValue::Numeric(
          ScalarNumber::Integer(
            @bigint.BigInt::from_string(
              "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
            ),
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: int too large to convert to float")
}

///|
fn log_params_case_33() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(
      formatter.set_base(
        LogValue::Numeric(
          ScalarNumber::Integer(
            @bigint.BigInt::from_string(
              "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
            ),
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: int too large to convert to float")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_34() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(base=LogValue::Text("2"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_35() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("2"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_36() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatter::new(base=LogValue::Text("not a number")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: could not convert string to float: 'not a number'",
  )
}

///|
fn log_params_case_37() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("not a number")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: could not convert string to float: 'not a number'",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_38() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(base=LogValue::Text("1_0.5"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_39() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("1_0.5"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_40() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(base=LogValue::Text("٢.٥"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_41() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("٢.٥"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_42() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(base=LogValue::Text("1e+٣"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1000.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_43() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("1e+٣"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1000.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_44() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(base=LogValue::Text("nan"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_45() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("nan"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_46() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(base=LogValue::Text("-inf"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_47() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("-inf"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_48() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatter::new(base=LogValue::Text("1__0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '1__0'")
}

///|
fn log_params_case_49() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("1__0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '1__0'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_50() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatter::new(base=LogValue::Text("0x1p0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '0x1p0'")
}

///|
fn log_params_case_51() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("0x1p0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '0x1p0'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_52() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(base=LogValue::Text(" 2 "))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_53() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text(" 2 "))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_54() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatter::new(base=LogValue::Text("\u001c2")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '\\x1c2'")
}

///|
fn log_params_case_55() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("\u001c2")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '\\x1c2'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_56() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("10")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_57() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("10"))),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_58() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_59() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(10.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_60() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::NumpyFloat64(10.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_61() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyFloat64(10.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_62() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::NumpyInt64(10L)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_63() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyInt64(10L)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_64() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_65() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Boolean(false)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_66() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_67() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Boolean(true)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_68() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_69() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_70() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterExponent::new(base=LogValue::NoneValue))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: float() argument must be a string or a real number, not 'NoneType'",
  )
}

///|
fn log_params_case_71() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::NoneValue))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: float() argument must be a string or a real number, not 'NoneType'",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_72() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_73() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_74() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_75() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_76() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_77() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-2.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_78() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_79() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(1.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_80() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_81() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.5)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_82() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_83() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_84() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_85() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_86() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_87() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_88() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(
      LogFormatterExponent::new(
        base=LogValue::Numeric(
          ScalarNumber::Integer(
            @bigint.BigInt::from_string(
              "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
            ),
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: int too large to convert to float")
}

///|
fn log_params_case_89() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(
      formatter.set_base(
        LogValue::Numeric(
          ScalarNumber::Integer(
            @bigint.BigInt::from_string(
              "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
            ),
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: int too large to convert to float")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_90() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(base=LogValue::Text("2"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_91() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("2"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_92() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterExponent::new(base=LogValue::Text("not a number")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: could not convert string to float: 'not a number'",
  )
}

///|
fn log_params_case_93() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("not a number")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: could not convert string to float: 'not a number'",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_94() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(base=LogValue::Text("1_0.5"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_95() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("1_0.5"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_96() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(base=LogValue::Text("٢.٥"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_97() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("٢.٥"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_98() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(base=LogValue::Text("1e+٣"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1000.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_99() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("1e+٣"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1000.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_100() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(base=LogValue::Text("nan"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_101() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("nan"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_102() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(base=LogValue::Text("-inf"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_103() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("-inf"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_104() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterExponent::new(base=LogValue::Text("1__0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '1__0'")
}

///|
fn log_params_case_105() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("1__0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '1__0'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_106() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterExponent::new(base=LogValue::Text("0x1p0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '0x1p0'")
}

///|
fn log_params_case_107() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("0x1p0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '0x1p0'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_108() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(base=LogValue::Text(" 2 "))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_109() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text(" 2 "))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_110() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterExponent::new(base=LogValue::Text("\u001c2")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '\\x1c2'")
}

///|
fn log_params_case_111() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("\u001c2")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '\\x1c2'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_112() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("10")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_113() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("10"))),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_114() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_115() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(10.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_116() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::NumpyFloat64(10.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_117() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyFloat64(10.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_118() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::NumpyInt64(10L)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_119() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyInt64(10L)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_120() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_121() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Boolean(false)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_122() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_123() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Boolean(true)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_124() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_125() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_126() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterMathtext::new(base=LogValue::NoneValue))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: float() argument must be a string or a real number, not 'NoneType'",
  )
}

///|
fn log_params_case_127() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::NoneValue))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: float() argument must be a string or a real number, not 'NoneType'",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_128() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_129() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_130() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_131() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_132() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_133() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-2.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_134() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_135() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(1.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_136() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_137() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.5)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_138() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_139() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_140() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_141() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_142() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_143() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_144() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(
      LogFormatterMathtext::new(
        base=LogValue::Numeric(
          ScalarNumber::Integer(
            @bigint.BigInt::from_string(
              "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
            ),
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: int too large to convert to float")
}

///|
fn log_params_case_145() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(
      formatter.set_base(
        LogValue::Numeric(
          ScalarNumber::Integer(
            @bigint.BigInt::from_string(
              "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
            ),
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: int too large to convert to float")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_146() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(base=LogValue::Text("2"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_147() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("2"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_148() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterMathtext::new(base=LogValue::Text("not a number")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: could not convert string to float: 'not a number'",
  )
}

///|
fn log_params_case_149() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("not a number")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: could not convert string to float: 'not a number'",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_150() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(base=LogValue::Text("1_0.5"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_151() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("1_0.5"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_152() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(base=LogValue::Text("٢.٥"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_153() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("٢.٥"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_154() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(base=LogValue::Text("1e+٣"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1000.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_155() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("1e+٣"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1000.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_156() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(base=LogValue::Text("nan"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_157() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("nan"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_158() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(base=LogValue::Text("-inf"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_159() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("-inf"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_160() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterMathtext::new(base=LogValue::Text("1__0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '1__0'")
}

///|
fn log_params_case_161() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("1__0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '1__0'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_162() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterMathtext::new(base=LogValue::Text("0x1p0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '0x1p0'")
}

///|
fn log_params_case_163() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("0x1p0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '0x1p0'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_164() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(base=LogValue::Text(" 2 "))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_165() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text(" 2 "))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_166() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterMathtext::new(base=LogValue::Text("\u001c2")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '\\x1c2'")
}

///|
fn log_params_case_167() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("\u001c2")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '\\x1c2'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_168() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("10")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_169() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("10"))),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_170() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_171() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(10.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_172() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::NumpyFloat64(10.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_173() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyFloat64(10.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_174() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::NumpyInt64(10L)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_175() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyInt64(10L)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_176() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_177() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Boolean(false)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_178() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_179() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Boolean(true)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_180() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_181() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_182() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterSciNotation::new(base=LogValue::NoneValue))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: float() argument must be a string or a real number, not 'NoneType'",
  )
}

///|
fn log_params_case_183() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::NoneValue))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: float() argument must be a string or a real number, not 'NoneType'",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_184() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_185() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_186() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_187() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_188() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_189() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-2.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_190() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_191() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(1.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_192() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_193() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.5)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_194() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_195() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_196() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_197() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_198() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_199() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_200() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(
      LogFormatterSciNotation::new(
        base=LogValue::Numeric(
          ScalarNumber::Integer(
            @bigint.BigInt::from_string(
              "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
            ),
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: int too large to convert to float")
}

///|
fn log_params_case_201() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(
      formatter.set_base(
        LogValue::Numeric(
          ScalarNumber::Integer(
            @bigint.BigInt::from_string(
              "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
            ),
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: int too large to convert to float")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_202() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(base=LogValue::Text("2"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_203() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("2"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_204() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterSciNotation::new(base=LogValue::Text("not a number")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: could not convert string to float: 'not a number'",
  )
}

///|
fn log_params_case_205() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("not a number")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: could not convert string to float: 'not a number'",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_206() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(base=LogValue::Text("1_0.5"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_207() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("1_0.5"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_208() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(base=LogValue::Text("٢.٥"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_209() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("٢.٥"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.5)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_210() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(base=LogValue::Text("1e+٣"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1000.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_211() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("1e+٣"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(1000.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_212() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(base=LogValue::Text("nan"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_213() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("nan"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_214() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(base=LogValue::Text("-inf"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_215() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text("-inf"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_216() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterSciNotation::new(base=LogValue::Text("1__0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '1__0'")
}

///|
fn log_params_case_217() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("1__0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '1__0'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_218() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterSciNotation::new(base=LogValue::Text("0x1p0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '0x1p0'")
}

///|
fn log_params_case_219() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("0x1p0")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '0x1p0'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_220() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(base=LogValue::Text(" 2 "))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_221() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_base(LogValue::Text(" 2 "))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(2.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_222() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let error = try {
    ignore(LogFormatterSciNotation::new(base=LogValue::Text("\u001c2")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '\\x1c2'")
}

///|
fn log_params_case_223() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    base=LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_base(LogValue::Text("\u001c2")))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: could not convert string to float: '\\x1c2'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_224() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_classic_mode(false)
  let formatter = LogFormatter::new()
  let other = LogFormatter::new()
  let copied = formatter.copy()
  @config.set_classic_mode(true)
  let tuple = match formatter.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let other_tuple = match other.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let copy_tuple = match copied.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  assert_true(physical_equal(tuple, other_tuple))
  assert_true(physical_equal(tuple, copy_tuple))
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
  log_params_value(tuple.get(1), LogValue::Numeric(ScalarNumber::Number(0.4)))
  let snapshot = tuple.values()
  snapshot[0] = LogValue::Text("changed copy")
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
}

///|
fn log_params_case_225() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_classic_mode(true)
  let formatter = LogFormatter::new()
  let other = LogFormatter::new()
  let copied = formatter.copy()
  @config.set_classic_mode(false)
  let tuple = match formatter.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let other_tuple = match other.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let copy_tuple = match copied.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  assert_true(physical_equal(tuple, other_tuple))
  assert_true(physical_equal(tuple, copy_tuple))
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(
    tuple.get(1),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  let snapshot = tuple.values()
  snapshot[0] = LogValue::Text("changed copy")
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_226() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_classic_mode(false)
  let formatter = LogFormatterExponent::new()
  let other = LogFormatterExponent::new()
  let copied = formatter.copy()
  @config.set_classic_mode(true)
  let tuple = match formatter.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let other_tuple = match other.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let copy_tuple = match copied.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  assert_true(physical_equal(tuple, other_tuple))
  assert_true(physical_equal(tuple, copy_tuple))
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
  log_params_value(tuple.get(1), LogValue::Numeric(ScalarNumber::Number(0.4)))
  let snapshot = tuple.values()
  snapshot[0] = LogValue::Text("changed copy")
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
}

///|
fn log_params_case_227() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_classic_mode(true)
  let formatter = LogFormatterExponent::new()
  let other = LogFormatterExponent::new()
  let copied = formatter.copy()
  @config.set_classic_mode(false)
  let tuple = match formatter.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let other_tuple = match other.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let copy_tuple = match copied.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  assert_true(physical_equal(tuple, other_tuple))
  assert_true(physical_equal(tuple, copy_tuple))
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(
    tuple.get(1),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  let snapshot = tuple.values()
  snapshot[0] = LogValue::Text("changed copy")
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_228() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_classic_mode(false)
  let formatter = LogFormatterMathtext::new()
  let other = LogFormatterMathtext::new()
  let copied = formatter.copy()
  @config.set_classic_mode(true)
  let tuple = match formatter.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let other_tuple = match other.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let copy_tuple = match copied.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  assert_true(physical_equal(tuple, other_tuple))
  assert_true(physical_equal(tuple, copy_tuple))
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
  log_params_value(tuple.get(1), LogValue::Numeric(ScalarNumber::Number(0.4)))
  let snapshot = tuple.values()
  snapshot[0] = LogValue::Text("changed copy")
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
}

///|
fn log_params_case_229() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_classic_mode(true)
  let formatter = LogFormatterMathtext::new()
  let other = LogFormatterMathtext::new()
  let copied = formatter.copy()
  @config.set_classic_mode(false)
  let tuple = match formatter.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let other_tuple = match other.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let copy_tuple = match copied.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  assert_true(physical_equal(tuple, other_tuple))
  assert_true(physical_equal(tuple, copy_tuple))
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(
    tuple.get(1),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  let snapshot = tuple.values()
  snapshot[0] = LogValue::Text("changed copy")
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_230() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_classic_mode(false)
  let formatter = LogFormatterSciNotation::new()
  let other = LogFormatterSciNotation::new()
  let copied = formatter.copy()
  @config.set_classic_mode(true)
  let tuple = match formatter.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let other_tuple = match other.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let copy_tuple = match copied.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  assert_true(physical_equal(tuple, other_tuple))
  assert_true(physical_equal(tuple, copy_tuple))
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
  log_params_value(tuple.get(1), LogValue::Numeric(ScalarNumber::Number(0.4)))
  let snapshot = tuple.values()
  snapshot[0] = LogValue::Text("changed copy")
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
}

///|
fn log_params_case_231() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_classic_mode(true)
  let formatter = LogFormatterSciNotation::new()
  let other = LogFormatterSciNotation::new()
  let copied = formatter.copy()
  @config.set_classic_mode(false)
  let tuple = match formatter.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let other_tuple = match other.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  let copy_tuple = match copied.minor_thresholds() {
    Some(Tuple(tuple)) => tuple
    _ => abort("expected tuple")
  }
  assert_true(physical_equal(tuple, other_tuple))
  assert_true(physical_equal(tuple, copy_tuple))
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(
    tuple.get(1),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  let snapshot = tuple.values()
  snapshot[0] = LogValue::Text("changed copy")
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_232() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(label_only_base=LogValue::NoneValue)
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::NoneValue)
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::NoneValue)
  log_params_value(formatter.label_only_base(), LogValue::NoneValue)
}

///|
fn log_params_case_233() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Boolean(false)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
}

///|
fn log_params_case_234() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Boolean(true)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
}

///|
fn log_params_case_235() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    label_only_base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_236() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    label_only_base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
}

///|
fn log_params_case_237() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Number(0.0)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
}

///|
fn log_params_case_238() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
}

///|
fn log_params_case_239() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyInt64(2L)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
}

///|
fn log_params_case_240() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
}

///|
fn log_params_case_241() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyBool(false)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
}

///|
fn log_params_case_242() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(label_only_base=LogValue::Text(""))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::Text(""))
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Text(""))
  log_params_value(formatter.label_only_base(), LogValue::Text(""))
}

///|
fn log_params_case_243() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(label_only_base=LogValue::Text("False"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::Text("False"))
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Text("False"))
  log_params_value(formatter.label_only_base(), LogValue::Text("False"))
}

///|
fn log_params_case_244() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(label_only_base=LogValue::NoneValue)
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::NoneValue)
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::NoneValue)
  log_params_value(formatter.label_only_base(), LogValue::NoneValue)
}

///|
fn log_params_case_245() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Boolean(false)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
}

///|
fn log_params_case_246() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Boolean(true)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
}

///|
fn log_params_case_247() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_248() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
}

///|
fn log_params_case_249() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Number(0.0)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
}

///|
fn log_params_case_250() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
}

///|
fn log_params_case_251() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyInt64(2L)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
}

///|
fn log_params_case_252() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
}

///|
fn log_params_case_253() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyBool(false)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
}

///|
fn log_params_case_254() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(label_only_base=LogValue::Text(""))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::Text(""))
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Text(""))
  log_params_value(formatter.label_only_base(), LogValue::Text(""))
}

///|
fn log_params_case_255() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Text("False"),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::Text("False"))
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Text("False"))
  log_params_value(formatter.label_only_base(), LogValue::Text("False"))
}

///|
fn log_params_case_256() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(label_only_base=LogValue::NoneValue)
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::NoneValue)
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::NoneValue)
  log_params_value(formatter.label_only_base(), LogValue::NoneValue)
}

///|
fn log_params_case_257() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Boolean(false)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
}

///|
fn log_params_case_258() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Boolean(true)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
}

///|
fn log_params_case_259() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_260() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
}

///|
fn log_params_case_261() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Number(0.0)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
}

///|
fn log_params_case_262() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
}

///|
fn log_params_case_263() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyInt64(2L)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
}

///|
fn log_params_case_264() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
}

///|
fn log_params_case_265() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyBool(false)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
}

///|
fn log_params_case_266() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(label_only_base=LogValue::Text(""))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::Text(""))
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Text(""))
  log_params_value(formatter.label_only_base(), LogValue::Text(""))
}

///|
fn log_params_case_267() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Text("False"),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::Text("False"))
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Text("False"))
  log_params_value(formatter.label_only_base(), LogValue::Text("False"))
}

///|
fn log_params_case_268() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::NoneValue,
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::NoneValue)
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::NoneValue)
  log_params_value(formatter.label_only_base(), LogValue::NoneValue)
}

///|
fn log_params_case_269() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Boolean(false)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
}

///|
fn log_params_case_270() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Boolean(true)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
}

///|
fn log_params_case_271() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_272() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Numeric(
      ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
    ),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("2"))),
  )
}

///|
fn log_params_case_273() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::Number(0.0)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
}

///|
fn log_params_case_274() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(2.0)),
  )
}

///|
fn log_params_case_275() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyInt64(2L)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(2L)),
  )
}

///|
fn log_params_case_276() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyBool(true)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
}

///|
fn log_params_case_277() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Numeric(ScalarNumber::NumpyBool(false)))
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::NumpyBool(false)),
  )
}

///|
fn log_params_case_278() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Text(""),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::Text(""))
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), false)
  formatter.set_label_minor(LogValue::Text(""))
  log_params_value(formatter.label_only_base(), LogValue::Text(""))
}

///|
fn log_params_case_279() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Text("False"),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(formatter.label_only_base(), LogValue::Text("False"))
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(log_value_truth(formatter.label_only_base()), true)
  formatter.set_label_minor(LogValue::Text("False"))
  log_params_value(formatter.label_only_base(), LogValue::Text("False"))
}

///|
fn log_params_case_280() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Tuple(LogThresholdTuple::new([])))
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: tuple index out of range")
}

///|
fn log_params_case_281() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Tuple(LogThresholdTuple::new([])))
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: tuple index out of range")
}

///|
fn log_params_case_282() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Tuple(LogThresholdTuple::new([])))
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: tuple index out of range")
}

///|
fn log_params_case_283() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(LogMinorThresholds::Tuple(LogThresholdTuple::new([]))),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: tuple index out of range")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_284() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Tuple(
      LogThresholdTuple::new([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
        ),
      ]),
    ),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_285() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Tuple(
      LogThresholdTuple::new([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
        ),
      ]),
    ),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: tuple index out of range")
}

///|
fn log_params_case_286() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Tuple(
      LogThresholdTuple::new([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
        ),
      ]),
    ),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_287() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  formatter.set_locs(locations=[999.0])
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_288() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Tuple(
      LogThresholdTuple::new([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
        ),
      ]),
    ),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("100"))),
  )
}

///|
fn log_params_case_289() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Tuple(
      LogThresholdTuple::new([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
        ),
      ]),
    ),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: tuple index out of range")
}

///|
fn log_params_case_290() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Tuple(
      LogThresholdTuple::new([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
        ),
      ]),
    ),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("100"))),
  )
}

///|
fn log_params_case_291() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: tuple index out of range")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_292() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Tuple(
      LogThresholdTuple::new([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
        ),
        LogValue::Numeric(ScalarNumber::Number(0.4)),
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("99")),
        ),
      ]),
    ),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
}

///|
fn log_params_case_293() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Tuple(
      LogThresholdTuple::new([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
        ),
        LogValue::Numeric(ScalarNumber::Number(0.4)),
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("99")),
        ),
      ]),
    ),
  )
  log_params_value(
    log_threshold_at(thresholds, 1),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  )
}

///|
fn log_params_case_294() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Tuple(
      LogThresholdTuple::new([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
        ),
        LogValue::Numeric(ScalarNumber::Number(0.4)),
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("99")),
        ),
      ]),
    ),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("99"))),
  )
}

///|
fn log_params_case_295() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
          ),
          LogValue::Numeric(ScalarNumber::Number(0.4)),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("99")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  formatter.set_locs(locations=[999.0])
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_296() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Sequence([]))
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
}

///|
fn log_params_case_297() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Sequence([]))
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
}

///|
fn log_params_case_298() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Sequence([]))
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
}

///|
fn log_params_case_299() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(Some(LogMinorThresholds::Sequence([])))
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_300() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_301() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    ]),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
}

///|
fn log_params_case_302() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
}

///|
fn log_params_case_303() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
        ),
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  formatter.set_locs(locations=[999.0])
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_304() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(
        ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
      ),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("100"))),
  )
}

///|
fn log_params_case_305() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(
        ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
      ),
    ]),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
}

///|
fn log_params_case_306() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(
        ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
      ),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("100"))),
  )
}

///|
fn log_params_case_307() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
        ),
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_308() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
      LogValue::Numeric(
        ScalarNumber::Integer(@bigint.BigInt::from_string("99")),
      ),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
}

///|
fn log_params_case_309() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
      LogValue::Numeric(
        ScalarNumber::Integer(@bigint.BigInt::from_string("99")),
      ),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 1),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  )
}

///|
fn log_params_case_310() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
      LogValue::Numeric(
        ScalarNumber::Integer(@bigint.BigInt::from_string("99")),
      ),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("99"))),
  )
}

///|
fn log_params_case_311() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
        ),
        LogValue::Numeric(ScalarNumber::Number(0.4)),
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("99")),
        ),
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  formatter.set_locs(locations=[999.0])
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_312() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
}

///|
fn log_params_case_313() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
    ]),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
}

///|
fn log_params_case_314() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
}

///|
fn log_params_case_315() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  formatter.set_locs(locations=[999.0])
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_316() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
}

///|
fn log_params_case_317() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
    ]),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
}

///|
fn log_params_case_318() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
}

///|
fn log_params_case_319() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  formatter.set_locs(locations=[999.0])
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), None)
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_320() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
}

///|
fn log_params_case_321() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 1),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  )
}

///|
fn log_params_case_322() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  )
}

///|
fn log_params_case_323() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
        LogValue::Numeric(ScalarNumber::Number(0.4)),
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  formatter.set_locs(locations=[999.0])
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_324() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::NoneValue,
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(log_threshold_at(thresholds, 0), LogValue::NoneValue)
}

///|
fn log_params_case_325() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::NoneValue,
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 1),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  )
}

///|
fn log_params_case_326() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::NoneValue,
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  )
}

///|
fn log_params_case_327() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::NoneValue,
        LogValue::Numeric(ScalarNumber::Number(0.4)),
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: ufunc 'isinf' not supported for the input types, and the inputs could not be safely coerced to any supported types according to the casting rule ''safe''",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_328() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Text("1"),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(log_threshold_at(thresholds, 0), LogValue::Text("1"))
}

///|
fn log_params_case_329() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Text("1"),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 1),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  )
}

///|
fn log_params_case_330() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Text("1"),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  )
}

///|
fn log_params_case_331() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::Text("1"),
        LogValue::Numeric(ScalarNumber::Number(0.4)),
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: ufunc 'isinf' not supported for the input types, and the inputs could not be safely coerced to any supported types according to the casting rule ''safe''",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_332() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
          ),
        ),
      ),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
}

///|
fn log_params_case_333() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
          ),
        ),
      ),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 1),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  )
}

///|
fn log_params_case_334() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(
        ScalarNumber::Integer(
          @bigint.BigInt::from_string(
            "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
          ),
        ),
      ),
      LogValue::Numeric(ScalarNumber::Number(0.4)),
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  )
}

///|
fn log_params_case_335() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::Numeric(
          ScalarNumber::Integer(
            @bigint.BigInt::from_string(
              "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
            ),
          ),
        ),
        LogValue::Numeric(ScalarNumber::Number(0.4)),
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: ufunc 'isinf' not supported for the input types, and the inputs could not be safely coerced to any supported types according to the casting rule ''safe''",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_336() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Boolean(false)),
      LogValue::NoneValue,
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
}

///|
fn log_params_case_337() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Boolean(false)),
      LogValue::NoneValue,
    ]),
  )
  log_params_value(log_threshold_at(thresholds, 1), LogValue::NoneValue)
}

///|
fn log_params_case_338() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Boolean(false)),
      LogValue::NoneValue,
    ]),
  )
  log_params_value(log_threshold_at(thresholds, -1), LogValue::NoneValue)
}

///|
fn log_params_case_339() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::Numeric(ScalarNumber::Boolean(false)),
        LogValue::NoneValue,
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  formatter.set_locs(locations=[999.0])
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_340() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Boolean(true)),
      LogValue::NoneValue,
    ]),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
}

///|
fn log_params_case_341() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Boolean(true)),
      LogValue::NoneValue,
    ]),
  )
  log_params_value(log_threshold_at(thresholds, 1), LogValue::NoneValue)
}

///|
fn log_params_case_342() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Sequence([
      LogValue::Numeric(ScalarNumber::Boolean(true)),
      LogValue::NoneValue,
    ]),
  )
  log_params_value(log_threshold_at(thresholds, -1), LogValue::NoneValue)
}

///|
fn log_params_case_343() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Sequence([
        LogValue::Numeric(ScalarNumber::Boolean(true)),
        LogValue::NoneValue,
      ]),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: '>' not supported between instances of 'float' and 'NoneType'",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_344() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([1.0, 0.4])),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(1.0)),
  )
}

///|
fn log_params_case_345() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([1.0, 0.4])),
  )
  log_params_value(
    log_threshold_at(thresholds, 1),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.4)),
  )
}

///|
fn log_params_case_346() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([1.0, 0.4])),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.4)),
  )
}

///|
fn log_params_case_347() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(LogMinorThresholds::NdArray(TickValues::from_array([1.0, 0.4]))),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  formatter.set_locs(locations=[999.0])
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_348() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([1L, 0L])),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::NumpyInt64(1L)),
  )
}

///|
fn log_params_case_349() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([1L, 0L])),
  )
  log_params_value(
    log_threshold_at(thresholds, 1),
    LogValue::Numeric(ScalarNumber::NumpyInt64(0L)),
  )
}

///|
fn log_params_case_350() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([1L, 0L])),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::NumpyInt64(0L)),
  )
}

///|
fn log_params_case_351() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(LogMinorThresholds::NdArray(TickValues::from_int64_array([1L, 0L]))),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  formatter.set_locs(locations=[999.0])
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_352() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::Number(1.0))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'float' object is not subscriptable")
}

///|
fn log_params_case_353() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::Number(1.0))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'float' object is not subscriptable")
}

///|
fn log_params_case_354() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::Number(1.0))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'float' object is not subscriptable")
}

///|
fn log_params_case_355() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::Number(1.0)))),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'float' object is not subscriptable")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_356() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(
      LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    ),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'int' object is not subscriptable")
}

///|
fn log_params_case_357() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(
      LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    ),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'int' object is not subscriptable")
}

///|
fn log_params_case_358() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(
      LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
    ),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'int' object is not subscriptable")
}

///|
fn log_params_case_359() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Raw(
        LogValue::Numeric(
          ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
        ),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'int' object is not subscriptable")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_360() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::Boolean(true))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'bool' object is not subscriptable")
}

///|
fn log_params_case_361() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::Boolean(true))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'bool' object is not subscriptable")
}

///|
fn log_params_case_362() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::Boolean(true))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'bool' object is not subscriptable")
}

///|
fn log_params_case_363() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::Boolean(true))),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'bool' object is not subscriptable")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_364() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyFloat64(1.0))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
}

///|
fn log_params_case_365() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyFloat64(1.0))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
}

///|
fn log_params_case_366() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyFloat64(1.0))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
}

///|
fn log_params_case_367() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Raw(
        LogValue::Numeric(ScalarNumber::NumpyFloat64(1.0)),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_368() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyInt64(1L))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
}

///|
fn log_params_case_369() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyInt64(1L))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
}

///|
fn log_params_case_370() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyInt64(1L))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
}

///|
fn log_params_case_371() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyInt64(1L))),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_372() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyBool(true))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
}

///|
fn log_params_case_373() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyBool(true))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
}

///|
fn log_params_case_374() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyBool(true))),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
}

///|
fn log_params_case_375() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(
      LogMinorThresholds::Raw(LogValue::Numeric(ScalarNumber::NumpyBool(true))),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: invalid index to scalar variable.")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_376() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Raw(LogValue::Text("12")))
  log_params_value(log_threshold_at(thresholds, 0), LogValue::Text("1"))
}

///|
fn log_params_case_377() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Raw(LogValue::Text("12")))
  log_params_value(log_threshold_at(thresholds, 1), LogValue::Text("2"))
}

///|
fn log_params_case_378() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Raw(LogValue::Text("12")))
  log_params_value(log_threshold_at(thresholds, -1), LogValue::Text("2"))
}

///|
fn log_params_case_379() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(LogMinorThresholds::Raw(LogValue::Text("12"))),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: ufunc 'isinf' not supported for the input types, and the inputs could not be safely coerced to any supported types according to the casting rule ''safe''",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_380() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Raw(LogValue::Text("")))
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: string index out of range")
}

///|
fn log_params_case_381() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Raw(LogValue::Text("")))
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: string index out of range")
}

///|
fn log_params_case_382() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::Raw(LogValue::Text("")))
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: string index out of range")
}

///|
fn log_params_case_383() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(
    Some(LogMinorThresholds::Raw(LogValue::Text(""))),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: string index out of range")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_384() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = None
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'NoneType' object is not subscriptable")
}

///|
fn log_params_case_385() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = None
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'NoneType' object is not subscriptable")
}

///|
fn log_params_case_386() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = None
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'NoneType' object is not subscriptable")
}

///|
fn log_params_case_387() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  formatter.set_minor_thresholds(None)
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  let cache = log_cache_explicit([13.0])
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(cache)
  let error = try {
    ignore(formatter.set_locs(locations=[999.0]))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: 'NoneType' object is not subscriptable")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_388() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs()
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_389() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs(locations=[])
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_390() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs(locations=[999.0])
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_391() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs_view(TickValues::from_array([1.0, 2.0]))
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_392() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs()
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_393() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs(locations=[])
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_394() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs(locations=[999.0])
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_395() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs_view(TickValues::from_array([1.0, 2.0]))
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_396() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs()
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_397() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs(locations=[])
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_398() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs(locations=[999.0])
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_399() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs_view(TickValues::from_array([1.0, 2.0]))
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_400() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs()
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_401() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs(locations=[])
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_402() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs(locations=[999.0])
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_403() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
          LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
        ]),
      ),
    ),
  )
  formatter.set_locs_view(TickValues::from_array([1.0, 2.0]))
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.sublabels(), None)
}

///|
fn log_params_case_404() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::NoneValue,
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_405() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(ScalarNumber::Number(0.0)),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(ScalarNumber::Number(0.0)),
  )
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_406() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(ScalarNumber::Number(-0.0)),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(ScalarNumber::Number(-0.0)),
  )
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_407() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(ScalarNumber::Number(-1.0)),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(ScalarNumber::Number(-1.0)),
  )
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_408() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(ScalarNumber::Number(1.0)),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(ScalarNumber::Number(1.0)),
  )
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_409() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(ScalarNumber::Number(1.0 / 0.0)),
  )
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_410() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(ScalarNumber::Number(-1.0 / 0.0)),
  )
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_411() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(ScalarNumber::Number(0.0 / 0.0)),
  )
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_412() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(ScalarNumber::NumpyFloat64(1.0)),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(1.0)),
  )
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_413() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(ScalarNumber::NumpyInt64(1L)),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(ScalarNumber::NumpyInt64(1L)),
  )
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_414() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(ScalarNumber::NumpyBool(true)),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_locs())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: The numpy boolean negative, the `-` operator, is not supported, use the `~` operator or the logical_not function instead.",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(ScalarNumber::NumpyBool(true)),
  )
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_415() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(
    formatter.linthresh(),
    LogValue::Numeric(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
}

///|
fn log_params_case_416() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Text("1"),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_locs())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: bad operand type for unary -: 'str'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::Text("1"))
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_417() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    linthresh=LogValue::Text(""),
    minor_thresholds=Some(
      LogMinorThresholds::Tuple(
        LogThresholdTuple::new([
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
          LogValue::Numeric(
            ScalarNumber::Integer(@bigint.BigInt::from_string("100")),
          ),
        ]),
      ),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 2.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_locs())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: bad operand type for unary -: 'str'")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::Text(""))
  assert_eq(formatter.sublabels(), Some([13.0]))
}

///|
fn log_params_case_418() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(label_only_base=LogValue::Text("original"))
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 10.0]))
  formatter.set_axis(Some(axis))
  assert_eq(formatter.format_data(2.0), "2")
  assert_eq(formatter.label_only_base(), LogValue::Text("original"))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([1.0]),
  )
  assert_eq(formatter.format_data(2.0), "")
  assert_eq(formatter.label_only_base(), LogValue::Text("original"))
  assert_true(
    physical_equal(
      formatter.as_base_formatter(),
      formatter.as_base_formatter().log_formatter().unwrap().as_base_formatter(),
    ),
  )
}

///|
fn log_params_case_419() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  let error = try {
    ignore(formatter.format_data(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
}

///|
fn log_params_case_420() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(0.0)), "0")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_421() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(-0.0)), "-0")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_422() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(1.0)), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_423() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(2.0)), "2")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_424() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyInt64(123L)),
    "123",
  )
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_425() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyFloat64(-0.5)),
    "-0.5",
  )
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_426() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Boolean(true)), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_427() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Text("original"),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 10.0]))
  formatter.set_axis(Some(axis))
  assert_eq(formatter.format_data(2.0), "0.3")
  assert_eq(formatter.label_only_base(), LogValue::Text("original"))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([1.0]),
  )
  assert_eq(formatter.format_data(2.0), "")
  assert_eq(formatter.label_only_base(), LogValue::Text("original"))
  assert_true(
    physical_equal(
      formatter.as_base_formatter(),
      formatter.as_base_formatter().log_formatter().unwrap().as_base_formatter(),
    ),
  )
}

///|
fn log_params_case_428() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  let error = try {
    ignore(formatter.format_data(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
}

///|
fn log_params_case_429() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(0.0)), "0")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_430() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(-0.0)), "-0")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_431() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(1.0)), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_432() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(2.0)), "2")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_433() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new()
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyInt64(123L)),
    "123",
  )
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_434() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new()
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyFloat64(-0.5)),
    "-0.5",
  )
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_435() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Boolean(true)), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_436() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Text("original"),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 10.0]))
  formatter.set_axis(Some(axis))
  assert_eq(formatter.format_data(2.0), "10^0.30")
  assert_eq(formatter.label_only_base(), LogValue::Text("original"))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([1.0]),
  )
  assert_eq(formatter.format_data(2.0), "")
  assert_eq(formatter.label_only_base(), LogValue::Text("original"))
  assert_true(
    physical_equal(
      formatter.as_base_formatter(),
      formatter.as_base_formatter().log_formatter().unwrap().as_base_formatter(),
    ),
  )
}

///|
fn log_params_case_437() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(formatter.format_data(1.0), "10^0")
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
}

///|
fn log_params_case_438() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(0.0)), "0")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_439() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(-0.0)), "-0")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_440() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(1.0)), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_441() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(2.0)), "2")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_442() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new()
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyInt64(123L)),
    "123",
  )
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_443() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new()
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyFloat64(-0.5)),
    "-0.5",
  )
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_444() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Boolean(true)), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_445() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Text("original"),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 10.0]))
  formatter.set_axis(Some(axis))
  assert_eq(formatter.format_data(2.0), "2x10^0")
  assert_eq(formatter.label_only_base(), LogValue::Text("original"))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([1.0]),
  )
  assert_eq(formatter.format_data(2.0), "")
  assert_eq(formatter.label_only_base(), LogValue::Text("original"))
  assert_true(
    physical_equal(
      formatter.as_base_formatter(),
      formatter.as_base_formatter().log_formatter().unwrap().as_base_formatter(),
    ),
  )
}

///|
fn log_params_case_446() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new(
    label_only_base=LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
  assert_eq(formatter.format_data(1.0), "10^0")
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(true)),
  )
}

///|
fn log_params_case_447() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(0.0)), "0")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_448() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(-0.0)), "-0")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_449() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(1.0)), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_450() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Number(2.0)), "2")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_451() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new()
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyInt64(123L)),
    "123",
  )
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_452() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new()
  assert_eq(
    formatter.format_data_short_value(ScalarNumber::NumpyFloat64(-0.5)),
    "-0.5",
  )
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_453() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new()
  assert_eq(formatter.format_data_short_value(ScalarNumber::Boolean(true)), "1")
  assert_eq(formatter.get_offset(), "")
}

///|
fn log_params_case_454() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(label_only_base=LogValue::Text("original"))
  let axis = FormatterAxisBinding::new()
  axis.bind_view_interval(fn() {
    formatter.set_label_only_base(LogValue::Text("during"))
    FormatterViewInterval::Sequence([1.0, 10.0])
  })
  formatter.set_axis(Some(axis))
  assert_eq(formatter.format_data(2.0), "2")
  assert_eq(formatter.label_only_base(), LogValue::Text("original"))
}

///|
fn log_params_case_455() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(label_only_base=LogValue::Text("original"))
  let axis = FormatterAxisBinding::new()
  axis.bind_view_interval(fn() raise @core.DataError {
    formatter.set_label_only_base(LogValue::Text("during"))
    raise @core.DataError::InvalidTicks(
      message="ValueError: fixture view error",
    )
  })
  formatter.set_axis(Some(axis))
  let error = try {
    ignore(formatter.format_data(2.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: fixture view error")
  assert_eq(formatter.label_only_base(), LogValue::Text("original"))
}

///|
fn log_params_case_456() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(1))),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  ]
  let tuple = LogThresholdTuple::new(owner)
  owner[0] = LogValue::Text("owner changed")
  let exported = tuple.values()
  exported[0] = LogValue::Text("snapshot changed")
  log_params_value(
    tuple.get(0),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(1))),
  )
  assert_eq(tuple.length(), 2)
}

///|
fn log_params_case_457() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(1))),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  ]
  let formatter = LogFormatter::new(
    minor_thresholds=Some(LogMinorThresholds::Sequence(owner)),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  formatter.set_locs()
  let copied = formatter.copy()
  owner[0] = LogValue::Numeric(
    ScalarNumber::Integer(@bigint.BigInt::from_int(0)),
  )
  copied.set_locs()
  owner.push(
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(99))),
  )
  log_params_value(
    log_threshold_at(copied.minor_thresholds(), 2),
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_int(99))),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(copied.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    copied.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(copied.linthresh(), LogValue::NoneValue)
  assert_eq(copied.sublabels(), Some([1.0]))
  let snapshot = formatter.sublabels().unwrap()
  snapshot.clear()
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
}

///|
fn log_params_case_458() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [9.0, 0.4, 1.0, 9.0]
  let full = TickValues::from_array(owner)
  let view = full.view(2, -1, 2)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(LogMinorThresholds::NdArray(view)),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  formatter.set_locs()
  let copied = formatter.copy()
  view.set(0, 1.25)
  assert_eq(owner[2], 1.25)
  owner[2] = 0.0
  copied.set_locs()
  log_params_value(
    log_threshold_at(copied.minor_thresholds(), 0),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(copied.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    copied.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(copied.linthresh(), LogValue::NoneValue)
  assert_eq(copied.sublabels(), Some([1.0]))
}

///|
fn log_params_case_459() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [9.0, 1.0, 9.0, 0.4, 9.0]
  let full = TickValues::from_array(owner)
  let intermediate = full.view(1, 1, 3)
  let view = intermediate.view(0, 2, 2)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(LogMinorThresholds::NdArray(view)),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  formatter.set_locs()
  let copied = formatter.copy()
  view.set(0, 1.25)
  assert_eq(owner[1], 1.25)
  owner[1] = 0.0
  copied.set_locs()
  log_params_value(
    log_threshold_at(copied.minor_thresholds(), 0),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(copied.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    copied.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(copied.linthresh(), LogValue::NoneValue)
  assert_eq(copied.sublabels(), Some([1.0]))
}

///|
fn log_params_case_460() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [1.0, 9.0]
  let full = TickValues::from_array(owner)
  let view = full.view(0, 0, 2)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(LogMinorThresholds::NdArray(view)),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  formatter.set_locs()
  let copied = formatter.copy()
  view.set(0, 1.25)
  assert_eq(owner[0], 1.25)
  owner[0] = 0.0
  copied.set_locs()
  log_params_value(
    log_threshold_at(copied.minor_thresholds(), 0),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.0)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(
    formatter.sublabels(),
    Some([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(copied.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    copied.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(copied.linthresh(), LogValue::NoneValue)
  assert_eq(copied.sublabels(), Some([1.0]))
}

///|
fn log_params_case_461() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [9L, 1L, 0L, 9L]
  let full = TickValues::from_int64_array(owner)
  let view = full.view(1, 1, 2)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(LogMinorThresholds::NdArray(view)),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  formatter.set_locs()
  let copied = formatter.copy()
  view.set(0, 1.25)
  assert_eq(owner[1], 1L)
  owner[1] = 0L
  copied.set_locs()
  log_params_value(
    log_threshold_at(copied.minor_thresholds(), 0),
    LogValue::Numeric(ScalarNumber::NumpyInt64(0L)),
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(copied.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    copied.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(copied.linthresh(), LogValue::NoneValue)
  assert_eq(copied.sublabels(), Some([1.0]))
}

///|
fn log_params_case_462() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new()
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  formatter.set_locs()
  let copied = formatter.copy()
  copied.set_base(LogValue::Numeric(ScalarNumber::Number(3.0)))
  copied.set_label_minor(LogValue::NoneValue)
  copied.set_minor_thresholds(None)
  copied.set_linthresh(LogValue::Text("raw"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(copied.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(copied.label_only_base(), LogValue::NoneValue)
  log_params_value(copied.linthresh(), LogValue::Text("raw"))
  assert_eq(copied.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  assert_eq(formatter.axis(), copied.axis())
  assert_true(
    !physical_equal(formatter.as_base_formatter(), copied.as_base_formatter()),
  )
}

///|
fn log_params_case_463() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new()
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  formatter.set_locs()
  let copied = formatter.copy()
  copied.set_base(LogValue::Numeric(ScalarNumber::Number(3.0)))
  copied.set_label_minor(LogValue::NoneValue)
  copied.set_minor_thresholds(None)
  copied.set_linthresh(LogValue::Text("raw"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(copied.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(copied.label_only_base(), LogValue::NoneValue)
  log_params_value(copied.linthresh(), LogValue::Text("raw"))
  assert_eq(copied.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  assert_eq(formatter.axis(), copied.axis())
  assert_true(
    !physical_equal(formatter.as_base_formatter(), copied.as_base_formatter()),
  )
}

///|
fn log_params_case_464() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new()
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  formatter.set_locs()
  let copied = formatter.copy()
  copied.set_base(LogValue::Numeric(ScalarNumber::Number(3.0)))
  copied.set_label_minor(LogValue::NoneValue)
  copied.set_minor_thresholds(None)
  copied.set_linthresh(LogValue::Text("raw"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(copied.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(copied.label_only_base(), LogValue::NoneValue)
  log_params_value(copied.linthresh(), LogValue::Text("raw"))
  assert_eq(copied.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  assert_eq(formatter.axis(), copied.axis())
  assert_true(
    !physical_equal(formatter.as_base_formatter(), copied.as_base_formatter()),
  )
}

///|
fn log_params_case_465() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new()
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  formatter.set_locs()
  let copied = formatter.copy()
  copied.set_base(LogValue::Numeric(ScalarNumber::Number(3.0)))
  copied.set_label_minor(LogValue::NoneValue)
  copied.set_minor_thresholds(None)
  copied.set_linthresh(LogValue::Text("raw"))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(copied.base())),
    LogValue::Numeric(ScalarNumber::Number(3.0)),
  )
  log_params_value(copied.label_only_base(), LogValue::NoneValue)
  log_params_value(copied.linthresh(), LogValue::Text("raw"))
  assert_eq(copied.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  assert_eq(formatter.axis(), copied.axis())
  assert_true(
    !physical_equal(formatter.as_base_formatter(), copied.as_base_formatter()),
  )
}

///|
fn log_params_case_466() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterExponent::new()
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 10.0]))
  formatter.set_axis(Some(axis))
  let parent = formatter.as_log_formatter()
  assert_true(
    physical_equal(parent.as_base_formatter(), formatter.as_base_formatter()),
  )
  assert_eq(parent.format_data(2.0), "0.3")
}

///|
fn log_params_case_467() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterMathtext::new()
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 10.0]))
  formatter.set_axis(Some(axis))
  let parent = formatter.as_log_formatter()
  assert_true(
    physical_equal(parent.as_base_formatter(), formatter.as_base_formatter()),
  )
  assert_eq(parent.format_data(2.0), "10^0.30")
}

///|
fn log_params_case_468() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatterSciNotation::new()
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 10.0]))
  formatter.set_axis(Some(axis))
  let parent = formatter.as_log_formatter()
  assert_true(
    physical_equal(parent.as_base_formatter(), formatter.as_base_formatter()),
  )
  assert_eq(parent.format_data(2.0), "2x10^0")
  let mathtext = formatter.as_mathtext_formatter()
  assert_eq(mathtext.format_data(2.0), "2x10^0")
}

///|
fn log_params_case_469() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::NdArray(TickValues::from_array([])))
  let error = try {
    ignore(log_threshold_at(thresholds, -2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index -2 is out of bounds for axis 0 with size 0",
  )
}

///|
fn log_params_case_470() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::NdArray(TickValues::from_array([])))
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index -1 is out of bounds for axis 0 with size 0",
  )
}

///|
fn log_params_case_471() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::NdArray(TickValues::from_array([])))
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 0 is out of bounds for axis 0 with size 0",
  )
}

///|
fn log_params_case_472() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(LogMinorThresholds::NdArray(TickValues::from_array([])))
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 1 is out of bounds for axis 0 with size 0",
  )
}

///|
fn log_params_case_473() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(
      LogMinorThresholds::NdArray(TickValues::from_array([])),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_locs())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 0 is out of bounds for axis 0 with size 0",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_474() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([0.0])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index -2 is out of bounds for axis 0 with size 1",
  )
}

///|
fn log_params_case_475() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([0.0])),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.0)),
  )
}

///|
fn log_params_case_476() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([0.0])),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(0.0)),
  )
}

///|
fn log_params_case_477() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([0.0])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 1 is out of bounds for axis 0 with size 1",
  )
}

///|
fn log_params_case_478() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(
      LogMinorThresholds::NdArray(TickValues::from_array([0.0])),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_479() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([100.0])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index -2 is out of bounds for axis 0 with size 1",
  )
}

///|
fn log_params_case_480() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([100.0])),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(100.0)),
  )
}

///|
fn log_params_case_481() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([100.0])),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::NumpyFloat64(100.0)),
  )
}

///|
fn log_params_case_482() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_array([100.0])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 1 is out of bounds for axis 0 with size 1",
  )
}

///|
fn log_params_case_483() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(
      LogMinorThresholds::NdArray(TickValues::from_array([100.0])),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_locs())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 1 is out of bounds for axis 0 with size 1",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_484() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index -2 is out of bounds for axis 0 with size 0",
  )
}

///|
fn log_params_case_485() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index -1 is out of bounds for axis 0 with size 0",
  )
}

///|
fn log_params_case_486() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 0 is out of bounds for axis 0 with size 0",
  )
}

///|
fn log_params_case_487() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 1 is out of bounds for axis 0 with size 0",
  )
}

///|
fn log_params_case_488() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(
      LogMinorThresholds::NdArray(TickValues::from_int64_array([])),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_locs())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 0 is out of bounds for axis 0 with size 0",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_489() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([0L])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index -2 is out of bounds for axis 0 with size 1",
  )
}

///|
fn log_params_case_490() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([0L])),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::NumpyInt64(0L)),
  )
}

///|
fn log_params_case_491() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([0L])),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::NumpyInt64(0L)),
  )
}

///|
fn log_params_case_492() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([0L])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 1 is out of bounds for axis 0 with size 1",
  )
}

///|
fn log_params_case_493() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(
      LogMinorThresholds::NdArray(TickValues::from_int64_array([0L])),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_494() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([100L])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, -2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index -2 is out of bounds for axis 0 with size 1",
  )
}

///|
fn log_params_case_495() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([100L])),
  )
  log_params_value(
    log_threshold_at(thresholds, -1),
    LogValue::Numeric(ScalarNumber::NumpyInt64(100L)),
  )
}

///|
fn log_params_case_496() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([100L])),
  )
  log_params_value(
    log_threshold_at(thresholds, 0),
    LogValue::Numeric(ScalarNumber::NumpyInt64(100L)),
  )
}

///|
fn log_params_case_497() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let thresholds = Some(
    LogMinorThresholds::NdArray(TickValues::from_int64_array([100L])),
  )
  let error = try {
    ignore(log_threshold_at(thresholds, 1))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 1 is out of bounds for axis 0 with size 1",
  )
}

///|
fn log_params_case_498() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = LogFormatter::new(
    minor_thresholds=Some(
      LogMinorThresholds::NdArray(TickValues::from_int64_array([100L])),
    ),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  let error = try {
    ignore(formatter.set_locs())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "IndexError: index 1 is out of bounds for axis 0 with size 1",
  )
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  assert_eq(formatter.locations().length(), 0)
}

///|
fn log_params_case_499() -> Unit raise {
  let previous_classic = @config.classic_mode()
  let previous_exponent = @config.formatter_min_exponent()
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer {
    @config.set_classic_mode(previous_classic)
    @config.set_formatter_min_exponent(previous_exponent)
    @config.set_text_usetex(previous_tex)
    @config.set_unicode_minus(previous_minus)
  }
  @config.set_classic_mode(false)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [
    LogValue::Numeric(ScalarNumber::Integer(@bigint.BigInt::from_string("100"))),
    LogValue::Numeric(ScalarNumber::Number(0.4)),
  ]
  let formatter = LogFormatter::new(
    minor_thresholds=Some(LogMinorThresholds::Sequence(owner)),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(FormatterViewInterval::Sequence([1.0, 5.0]))
  formatter.set_axis(Some(axis))
  log_formatter_state(formatter.as_base_formatter()).sublabels = Some(
    log_cache_explicit([13.0]),
  )
  ignore(owner.pop())
  let error = try {
    ignore(formatter.set_locs())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([13.0]))
  owner.push(LogValue::Numeric(ScalarNumber::Number(0.4)))
  formatter.set_locs()
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
  owner.clear()
  let error = try {
    ignore(formatter.set_locs())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "IndexError: list index out of range")
  log_params_value(
    LogValue::Numeric(ScalarNumber::Number(formatter.base())),
    LogValue::Numeric(ScalarNumber::Number(10.0)),
  )
  log_params_value(
    formatter.label_only_base(),
    LogValue::Numeric(ScalarNumber::Boolean(false)),
  )
  log_params_value(formatter.linthresh(), LogValue::NoneValue)
  assert_eq(formatter.sublabels(), Some([1.0, 2.0, 3.0, 4.0, 6.0, 10.0]))
}

///|
test "LogFormatter params original group 0" {
  log_params_case_0()
  log_params_case_1()
  log_params_case_2()
  log_params_case_3()
  log_params_case_4()
  log_params_case_5()
  log_params_case_6()
  log_params_case_7()
  log_params_case_8()
  log_params_case_9()
  log_params_case_10()
  log_params_case_11()
  log_params_case_12()
  log_params_case_13()
  log_params_case_14()
  log_params_case_15()
  log_params_case_16()
  log_params_case_17()
  log_params_case_18()
  log_params_case_19()
  log_params_case_20()
  log_params_case_21()
  log_params_case_22()
  log_params_case_23()
  log_params_case_24()
  log_params_case_25()
  log_params_case_26()
  log_params_case_27()
  log_params_case_28()
  log_params_case_29()
  log_params_case_30()
  log_params_case_31()
}

///|
test "LogFormatter params original group 1" {
  log_params_case_32()
  log_params_case_33()
  log_params_case_34()
  log_params_case_35()
  log_params_case_36()
  log_params_case_37()
  log_params_case_38()
  log_params_case_39()
  log_params_case_40()
  log_params_case_41()
  log_params_case_42()
  log_params_case_43()
  log_params_case_44()
  log_params_case_45()
  log_params_case_46()
  log_params_case_47()
  log_params_case_48()
  log_params_case_49()
  log_params_case_50()
  log_params_case_51()
  log_params_case_52()
  log_params_case_53()
  log_params_case_54()
  log_params_case_55()
  log_params_case_56()
  log_params_case_57()
  log_params_case_58()
  log_params_case_59()
  log_params_case_60()
  log_params_case_61()
  log_params_case_62()
  log_params_case_63()
}

///|
test "LogFormatter params original group 2" {
  log_params_case_64()
  log_params_case_65()
  log_params_case_66()
  log_params_case_67()
  log_params_case_68()
  log_params_case_69()
  log_params_case_70()
  log_params_case_71()
  log_params_case_72()
  log_params_case_73()
  log_params_case_74()
  log_params_case_75()
  log_params_case_76()
  log_params_case_77()
  log_params_case_78()
  log_params_case_79()
  log_params_case_80()
  log_params_case_81()
  log_params_case_82()
  log_params_case_83()
  log_params_case_84()
  log_params_case_85()
  log_params_case_86()
  log_params_case_87()
  log_params_case_88()
  log_params_case_89()
  log_params_case_90()
  log_params_case_91()
  log_params_case_92()
  log_params_case_93()
  log_params_case_94()
  log_params_case_95()
}

///|
test "LogFormatter params original group 3" {
  log_params_case_96()
  log_params_case_97()
  log_params_case_98()
  log_params_case_99()
  log_params_case_100()
  log_params_case_101()
  log_params_case_102()
  log_params_case_103()
  log_params_case_104()
  log_params_case_105()
  log_params_case_106()
  log_params_case_107()
  log_params_case_108()
  log_params_case_109()
  log_params_case_110()
  log_params_case_111()
  log_params_case_112()
  log_params_case_113()
  log_params_case_114()
  log_params_case_115()
  log_params_case_116()
  log_params_case_117()
  log_params_case_118()
  log_params_case_119()
  log_params_case_120()
  log_params_case_121()
  log_params_case_122()
  log_params_case_123()
  log_params_case_124()
  log_params_case_125()
  log_params_case_126()
  log_params_case_127()
}

///|
test "LogFormatter params original group 4" {
  log_params_case_128()
  log_params_case_129()
  log_params_case_130()
  log_params_case_131()
  log_params_case_132()
  log_params_case_133()
  log_params_case_134()
  log_params_case_135()
  log_params_case_136()
  log_params_case_137()
  log_params_case_138()
  log_params_case_139()
  log_params_case_140()
  log_params_case_141()
  log_params_case_142()
  log_params_case_143()
  log_params_case_144()
  log_params_case_145()
  log_params_case_146()
  log_params_case_147()
  log_params_case_148()
  log_params_case_149()
  log_params_case_150()
  log_params_case_151()
  log_params_case_152()
  log_params_case_153()
  log_params_case_154()
  log_params_case_155()
  log_params_case_156()
  log_params_case_157()
  log_params_case_158()
  log_params_case_159()
}

///|
test "LogFormatter params original group 5" {
  log_params_case_160()
  log_params_case_161()
  log_params_case_162()
  log_params_case_163()
  log_params_case_164()
  log_params_case_165()
  log_params_case_166()
  log_params_case_167()
  log_params_case_168()
  log_params_case_169()
  log_params_case_170()
  log_params_case_171()
  log_params_case_172()
  log_params_case_173()
  log_params_case_174()
  log_params_case_175()
  log_params_case_176()
  log_params_case_177()
  log_params_case_178()
  log_params_case_179()
  log_params_case_180()
  log_params_case_181()
  log_params_case_182()
  log_params_case_183()
  log_params_case_184()
  log_params_case_185()
  log_params_case_186()
  log_params_case_187()
  log_params_case_188()
  log_params_case_189()
  log_params_case_190()
  log_params_case_191()
}

///|
test "LogFormatter params original group 6" {
  log_params_case_192()
  log_params_case_193()
  log_params_case_194()
  log_params_case_195()
  log_params_case_196()
  log_params_case_197()
  log_params_case_198()
  log_params_case_199()
  log_params_case_200()
  log_params_case_201()
  log_params_case_202()
  log_params_case_203()
  log_params_case_204()
  log_params_case_205()
  log_params_case_206()
  log_params_case_207()
  log_params_case_208()
  log_params_case_209()
  log_params_case_210()
  log_params_case_211()
  log_params_case_212()
  log_params_case_213()
  log_params_case_214()
  log_params_case_215()
  log_params_case_216()
  log_params_case_217()
  log_params_case_218()
  log_params_case_219()
  log_params_case_220()
  log_params_case_221()
  log_params_case_222()
  log_params_case_223()
}

///|
test "LogFormatter params original group 7" {
  log_params_case_224()
  log_params_case_225()
  log_params_case_226()
  log_params_case_227()
  log_params_case_228()
  log_params_case_229()
  log_params_case_230()
  log_params_case_231()
  log_params_case_232()
  log_params_case_233()
  log_params_case_234()
  log_params_case_235()
  log_params_case_236()
  log_params_case_237()
  log_params_case_238()
  log_params_case_239()
  log_params_case_240()
  log_params_case_241()
  log_params_case_242()
  log_params_case_243()
  log_params_case_244()
  log_params_case_245()
  log_params_case_246()
  log_params_case_247()
  log_params_case_248()
  log_params_case_249()
  log_params_case_250()
  log_params_case_251()
  log_params_case_252()
  log_params_case_253()
  log_params_case_254()
  log_params_case_255()
}

///|
test "LogFormatter params original group 8" {
  log_params_case_256()
  log_params_case_257()
  log_params_case_258()
  log_params_case_259()
  log_params_case_260()
  log_params_case_261()
  log_params_case_262()
  log_params_case_263()
  log_params_case_264()
  log_params_case_265()
  log_params_case_266()
  log_params_case_267()
  log_params_case_268()
  log_params_case_269()
  log_params_case_270()
  log_params_case_271()
  log_params_case_272()
  log_params_case_273()
  log_params_case_274()
  log_params_case_275()
  log_params_case_276()
  log_params_case_277()
  log_params_case_278()
  log_params_case_279()
  log_params_case_280()
  log_params_case_281()
  log_params_case_282()
  log_params_case_283()
  log_params_case_284()
  log_params_case_285()
  log_params_case_286()
  log_params_case_287()
}

///|
test "LogFormatter params original group 9" {
  log_params_case_288()
  log_params_case_289()
  log_params_case_290()
  log_params_case_291()
  log_params_case_292()
  log_params_case_293()
  log_params_case_294()
  log_params_case_295()
  log_params_case_296()
  log_params_case_297()
  log_params_case_298()
  log_params_case_299()
  log_params_case_300()
  log_params_case_301()
  log_params_case_302()
  log_params_case_303()
  log_params_case_304()
  log_params_case_305()
  log_params_case_306()
  log_params_case_307()
  log_params_case_308()
  log_params_case_309()
  log_params_case_310()
  log_params_case_311()
  log_params_case_312()
  log_params_case_313()
  log_params_case_314()
  log_params_case_315()
  log_params_case_316()
  log_params_case_317()
  log_params_case_318()
  log_params_case_319()
}

///|
test "LogFormatter params original group 10" {
  log_params_case_320()
  log_params_case_321()
  log_params_case_322()
  log_params_case_323()
  log_params_case_324()
  log_params_case_325()
  log_params_case_326()
  log_params_case_327()
  log_params_case_328()
  log_params_case_329()
  log_params_case_330()
  log_params_case_331()
  log_params_case_332()
  log_params_case_333()
  log_params_case_334()
  log_params_case_335()
  log_params_case_336()
  log_params_case_337()
  log_params_case_338()
  log_params_case_339()
  log_params_case_340()
  log_params_case_341()
  log_params_case_342()
  log_params_case_343()
  log_params_case_344()
  log_params_case_345()
  log_params_case_346()
  log_params_case_347()
  log_params_case_348()
  log_params_case_349()
  log_params_case_350()
  log_params_case_351()
}

///|
test "LogFormatter params original group 11" {
  log_params_case_352()
  log_params_case_353()
  log_params_case_354()
  log_params_case_355()
  log_params_case_356()
  log_params_case_357()
  log_params_case_358()
  log_params_case_359()
  log_params_case_360()
  log_params_case_361()
  log_params_case_362()
  log_params_case_363()
  log_params_case_364()
  log_params_case_365()
  log_params_case_366()
  log_params_case_367()
  log_params_case_368()
  log_params_case_369()
  log_params_case_370()
  log_params_case_371()
  log_params_case_372()
  log_params_case_373()
  log_params_case_374()
  log_params_case_375()
  log_params_case_376()
  log_params_case_377()
  log_params_case_378()
  log_params_case_379()
  log_params_case_380()
  log_params_case_381()
  log_params_case_382()
  log_params_case_383()
}

///|
test "LogFormatter params original group 12" {
  log_params_case_384()
  log_params_case_385()
  log_params_case_386()
  log_params_case_387()
  log_params_case_388()
  log_params_case_389()
  log_params_case_390()
  log_params_case_391()
  log_params_case_392()
  log_params_case_393()
  log_params_case_394()
  log_params_case_395()
  log_params_case_396()
  log_params_case_397()
  log_params_case_398()
  log_params_case_399()
  log_params_case_400()
  log_params_case_401()
  log_params_case_402()
  log_params_case_403()
  log_params_case_404()
  log_params_case_405()
  log_params_case_406()
  log_params_case_407()
  log_params_case_408()
  log_params_case_409()
  log_params_case_410()
  log_params_case_411()
  log_params_case_412()
  log_params_case_413()
  log_params_case_414()
  log_params_case_415()
}

///|
test "LogFormatter params original group 13" {
  log_params_case_416()
  log_params_case_417()
  log_params_case_418()
  log_params_case_419()
  log_params_case_420()
  log_params_case_421()
  log_params_case_422()
  log_params_case_423()
  log_params_case_424()
  log_params_case_425()
  log_params_case_426()
  log_params_case_427()
  log_params_case_428()
  log_params_case_429()
  log_params_case_430()
  log_params_case_431()
  log_params_case_432()
  log_params_case_433()
  log_params_case_434()
  log_params_case_435()
  log_params_case_436()
  log_params_case_437()
  log_params_case_438()
  log_params_case_439()
  log_params_case_440()
  log_params_case_441()
  log_params_case_442()
  log_params_case_443()
  log_params_case_444()
  log_params_case_445()
  log_params_case_446()
  log_params_case_447()
}

///|
test "LogFormatter params original group 14" {
  log_params_case_448()
  log_params_case_449()
  log_params_case_450()
  log_params_case_451()
  log_params_case_452()
  log_params_case_453()
  log_params_case_454()
  log_params_case_455()
  log_params_case_456()
  log_params_case_457()
  log_params_case_458()
  log_params_case_459()
  log_params_case_460()
  log_params_case_461()
  log_params_case_462()
  log_params_case_463()
  log_params_case_464()
  log_params_case_465()
  log_params_case_466()
  log_params_case_467()
  log_params_case_468()
  log_params_case_469()
  log_params_case_470()
  log_params_case_471()
  log_params_case_472()
  log_params_case_473()
  log_params_case_474()
  log_params_case_475()
  log_params_case_476()
  log_params_case_477()
  log_params_case_478()
  log_params_case_479()
}

///|
test "LogFormatter params original group 15" {
  log_params_case_480()
  log_params_case_481()
  log_params_case_482()
  log_params_case_483()
  log_params_case_484()
  log_params_case_485()
  log_params_case_486()
  log_params_case_487()
  log_params_case_488()
  log_params_case_489()
  log_params_case_490()
  log_params_case_491()
  log_params_case_492()
  log_params_case_493()
  log_params_case_494()
  log_params_case_495()
  log_params_case_496()
  log_params_case_497()
  log_params_case_498()
  log_params_case_499()
}
